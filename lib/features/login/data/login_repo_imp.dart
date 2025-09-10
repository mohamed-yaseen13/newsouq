import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq/core/api/api_error_handler.dart';
import 'package:newsouq/core/api/api_result.dart';

class LoginRepoImp {
  final FirebaseAuth auth;

  LoginRepoImp({required this.auth});

  Future<ApiResult<UserCredential>> login(String email, String password) async {
    try {
      final response = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
