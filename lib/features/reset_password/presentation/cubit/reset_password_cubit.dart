import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/reset_password/data/reset_password_repo_imp.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepoImp resetPasswordRepoImp;

  ResetPasswordCubit({required this.resetPasswordRepoImp})
    : super(ResetPasswordInitial());

  void sendPasswordResetEmail(String email) async {
    emit(ResetPasswordLoading());

    final response = await resetPasswordRepoImp.sendPasswordResetEmail(email);

    if (response is Success) {
      emit(ResetPasswordSuccess(email: email));
    } else if (response is Failure<void>) {
      emit(ResetPasswordError(apiErrorModel: response.apiErrorModel));
    }
  }

  void checkIfOtpCorrect(String email, String otp) async {
    emit(ResetPasswordLoading());

    final response = await resetPasswordRepoImp.checkIfOtpCorrect(email, otp);

    if (response is Success) {
      emit(ResetPasswordSuccess(email: email));
    } else if (response is Failure<void>) {
      emit(ResetPasswordError(apiErrorModel: response.apiErrorModel));
    }
  }

  void resetPassword(String email, String password) async {
    emit(ResetPasswordLoading());

    final response = await resetPasswordRepoImp.resetPassword(email, password);

    if (response is Success) {
      emit(ResetPasswordSuccess(email: email));
    } else if (response is Failure<void>) {
      emit(ResetPasswordError(apiErrorModel: response.apiErrorModel));
    }
  }
}
