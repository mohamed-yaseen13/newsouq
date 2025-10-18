import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq/core/database/database.dart';
import 'package:newsouq/core/services/send_email_otp.dart';

class ResetPasswordApiService {
  final FirebaseAuth auth;
  final Database database;

  ResetPasswordApiService({required this.auth, required this.database});

  Future<void> sendPasswordResetEmail(String email) async {
    final emailExist = await database.checkIfEmailExist(email);

    if (!emailExist) {
      throw Error.safeToString("Email Doesn't Exist");
    }
    final otp = await SendEmailOtp.sendEmailOtp(email);
    await database.saveOtpToDatabase(email, otp);
  }

  Future<void> checkIfOtpCorrect(String email, String otp) async {
    final bool isOtpCorrect = await database.isOtpCorrect(email, otp);

    if (!isOtpCorrect) {
      throw Error.safeToString("OTP Incorrect");
    }

    await database.deleteOtp(email);
  }

  Future<void> resetPassword(String email, String password) async {
    final oldPassword = await database.getPasswordFromDatabase(email);

    await auth.signInWithEmailAndPassword(email: email, password: oldPassword);

    await auth.currentUser!.updatePassword(password);

    await database.savePasswordToDatabase(email, password);
  }
}
