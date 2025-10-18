import 'package:newsouq/core/api/api_error_handler.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/reset_password/data/apis/reset_password_api_service.dart';

class ResetPasswordRepoImp {
  final ResetPasswordApiService resetPasswordApiService;

  ResetPasswordRepoImp({required this.resetPasswordApiService});

  Future<ApiResult<void>> sendPasswordResetEmail(String email) async {
    try {
      await resetPasswordApiService.sendPasswordResetEmail(email);

      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> checkIfOtpCorrect(String email, String otp) async {
    try {
      await resetPasswordApiService.checkIfOtpCorrect(email, otp);

      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> resetPassword(String email, String password) async {
    try {
      await resetPasswordApiService.resetPassword(email, password);
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
