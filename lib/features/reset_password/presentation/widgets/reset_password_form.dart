import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/core/widgets/app_button.dart';
import 'package:newsouq/core/widgets/confirm_password_text_form_field.dart';
import 'package:newsouq/core/widgets/password_text_form_field.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_cubit.dart';

class ResetPasswordForm extends StatefulWidget {
  final String email;

  const ResetPasswordForm({super.key, required this.email});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PasswordTextFormField(passwordController: _passwordController),
          verticalSpace(16),
          ConfirmPasswordTextFormField(
            confirmPasswordController: _confirmPasswordController,
            passwordController: _passwordController,
          ),
          verticalSpace(48),
          AppButton(
            desc: 'Continue',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<ResetPasswordCubit>().resetPassword(
                  widget.email,
                  _passwordController.text,
                );
              }
            },
            descStyle: AppTextStyles.whiteColor16FontSizeMedium,
          ),
        ],
      ),
    );
  }
}
