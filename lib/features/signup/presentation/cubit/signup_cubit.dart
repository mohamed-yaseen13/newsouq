import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/signup/data/repos/signup_repo_imp.dart';
import 'package:newsouq/features/signup/presentation/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepoImp signupRepoImp;

  SignupCubit({required this.signupRepoImp}) : super(SignupInitial());

  void signup(String email, String password) async {
    emit(SignupLoading());

    ApiResult<UserCredential> result = await signupRepoImp.signup(
      email,
      password,
    );

    if (result is Success<UserCredential>) {
      emit(SignupSuccess(userCredential: result.data));
    } else if (result is Failure<UserCredential>) {
      emit(SignupError(apiErrorModel: result.apiErrorModel));
    }
  }
}
