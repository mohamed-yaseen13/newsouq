import 'package:flutter/material.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class TermsAndConditionText extends StatelessWidget {
  const TermsAndConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "By signing up you agree to our ",
            style: AppTextStyles.gray4Color16FontSizeRegular,
          ),
          TextSpan(
            text: "Terms, Privacy Policy, ",
            style: AppTextStyles.blackColor16FontSizeMediumUnderline,
          ),
          TextSpan(
            text: 'and ',
            style: AppTextStyles.gray5Color16FontSizeRegular,
          ),
          TextSpan(
            text: "Cookie Use",
            style: AppTextStyles.blackColor16FontSizeMediumUnderline,
          ),
        ],
      ),
    );
  }
}
