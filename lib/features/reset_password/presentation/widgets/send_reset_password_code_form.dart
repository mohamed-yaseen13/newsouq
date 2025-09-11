import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/core/widgets/app_button.dart';
import 'package:newsouq/core/widgets/email_text_form_field.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_cubit.dart';

class SendResetPasswordCodeForm extends StatefulWidget {
  const SendResetPasswordCodeForm({super.key});

  @override
  State<SendResetPasswordCodeForm> createState() =>
      _SendResetPasswordCodeFormState();
}

class _SendResetPasswordCodeFormState extends State<SendResetPasswordCodeForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailTextFormField(emailController: _emailController),
          verticalSpace(48),
          AppButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<ResetPasswordCubit>().sendPasswordResetEmail(
                  _emailController.text,
                );
              }
            },
            desc: 'Send Code',
            descStyle: AppTextStyles.whiteColor16FontSizeMedium,
          ),
        ],
      ),
    );
  }
}
