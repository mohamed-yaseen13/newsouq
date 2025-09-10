import 'package:flutter/material.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class ForgotYourPasswordText extends StatelessWidget {
  const ForgotYourPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Forgot your password? ",
            style: AppTextStyles.gray4Color16FontSizeRegular,
          ),
          TextSpan(
            text: "Reset Your Password",
            style: AppTextStyles.blackColor16FontSizeMediumUnderline,
          ),
        ],
      ),
    );
  }
}
