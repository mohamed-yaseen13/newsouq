import 'package:flutter/material.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: AppTextStyles.gray4Color16FontSizeRegular,
          ),
          TextSpan(
            text: 'Log In',
            style: AppTextStyles.blackColor16FontSizeMediumUnderline,
          ),
        ],
      ),
    );
  }
}
