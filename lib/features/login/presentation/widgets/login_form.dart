import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/core/widgets/app_button.dart';
import 'package:newsouq/core/widgets/email_text_form_field.dart';
import 'package:newsouq/core/widgets/password_text_form_field.dart';
import 'package:newsouq/features/login/presentation/cubit/login_cubit.dart';
import 'package:newsouq/features/login/presentation/widgets/forgot_your_password_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailTextFormField(emailController: _emailController),
          verticalSpace(16),
          PasswordTextFormField(passwordController: _passwordController),
          verticalSpace(16),
          ForgotYourPasswordText(),
          verticalSpace(48),
          AppButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                debugPrint('Good');
                context.read<LoginCubit>().login(
                  _emailController.text,
                  _passwordController.text,
                );
              }
            },
            desc: 'Log In',
            descStyle: AppTextStyles.whiteColor16FontSizeMedium,
          ),
        ],
      ),
    );
  }
}
