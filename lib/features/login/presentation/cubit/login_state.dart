import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq/core/api/api_error_model.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserCredential userCredential;

  LoginSuccess({required this.userCredential});
}

class LoginError extends LoginState {
  final ApiErrorModel apiErrorModel;

  LoginError({required this.apiErrorModel});
}
