import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq/core/api/api_error_handler.dart';
import 'package:newsouq/core/api/api_error_model.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/core/database/database.dart';
import 'package:newsouq/core/services/send_email_otp.dart';

class ResetPasswordRepoImp {
  final FirebaseAuth auth;

  ResetPasswordRepoImp({required this.auth});

  Future<ApiResult<void>> sendPasswordResetEmail(String email) async {
    try {
      final emailExist = await Database.checkIfEmailExist(email);

      if (!emailExist) {
        return ApiResult.failure(
          ApiErrorModel(message: "Email doesn't exist "),
        );
      }
      final otp = await SendEmailOtp.sendEmailOtp(email);
      await Database.saveOtpToDatabase(email, otp);

      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> checkIfOtpCorrect(String email, String otp) async {
    final bool isOtpCorrect = await Database.isOtpCorrect(email, otp);

    if (!isOtpCorrect) {
      return ApiResult.failure(ApiErrorModel(message: "OTP Incorrect"));
    }

    await Database.deleteOtp(email);

    return ApiResult.success(null);
  }

  Future<ApiResult<void>> resetPassword(String email, String password) async {
    try {
      final oldPassword = await Database.getPasswordFromDatabase(email);

      await auth.signInWithEmailAndPassword(
        email: email,
        password: oldPassword,
      );

      await auth.currentUser!.updatePassword(password);

      await Database.savePasswordToDatabase(email, password);

      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
