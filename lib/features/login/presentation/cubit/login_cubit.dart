import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/login/data/repos/login_repo_imp.dart';
import 'package:newsouq/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepoImp loginRepoImp;

  LoginCubit({required this.loginRepoImp}) : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());

    ApiResult<UserCredential> result = await loginRepoImp.login(
      email,
      password,
    );

    if (result is Success<UserCredential>) {
      emit(LoginSuccess(userCredential: result.data));
    } else if (result is Failure<UserCredential>) {
      emit(LoginError(apiErrorModel: result.apiErrorModel));
    }
  }
}
