import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq/core/api/api_error_model.dart';

sealed class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserCredential userCredential;

  SignupSuccess({required this.userCredential});
}

class SignupError extends SignupState {
  final ApiErrorModel apiErrorModel;

  SignupError({required this.apiErrorModel});
}
