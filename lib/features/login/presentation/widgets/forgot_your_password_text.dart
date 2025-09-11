import 'package:flutter/material.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class ForgotYourPasswordText extends StatelessWidget {
  const ForgotYourPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Forgot your password? ",
          style: AppTextStyles.gray4Color16FontSizeRegular,
        ),
        InkWell(
          onTap: () {
            context.pushNamed(AppRoutes.forgotPasswordScreen);
          },
          child: Text(
            'Reset Your Password',
            style: AppTextStyles.blackColor16FontSizeMediumUnderline,
          ),
        ),
      ],
    );
  }
}
