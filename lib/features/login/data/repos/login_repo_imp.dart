import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq/core/api/api_error_handler.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/login/data/apis/login_api_service.dart';

class LoginRepoImp {
  final LoginApiService loginApiService;

  LoginRepoImp({required this.loginApiService});

  Future<ApiResult<UserCredential>> login(String email, String password) async {
    try {
      final response = await loginApiService.login(email, password);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
