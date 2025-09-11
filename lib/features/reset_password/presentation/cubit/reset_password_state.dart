import 'package:newsouq/core/api/api_error_model.dart';

sealed class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final String email;

  ResetPasswordSuccess({required this.email});
}

class ResetPasswordError extends ResetPasswordState {
  final ApiErrorModel apiErrorModel;

  ResetPasswordError({required this.apiErrorModel});
}
