import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq/core/api/api_error_handler.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/signup/data/apis/signup_api_service.dart';

class SignupRepoImp {
  final SignupApiService signupApiService;

  SignupRepoImp({required this.signupApiService});

  Future<ApiResult<UserCredential>> signup(
    String email,
    String password,
  ) async {
    try {
      final response = await signupApiService.signup(email, password);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
