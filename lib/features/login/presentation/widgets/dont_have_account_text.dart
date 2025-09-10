import 'package:flutter/material.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: AppTextStyles.gray4Color16FontSizeRegular,
        ),
        InkWell(
          onTap: () {
            context.pushNamed(AppRoutes.signupScreen);
          },
          child: Text(
            'Signup',
            style: AppTextStyles.blackColor16FontSizeMediumUnderline,
          ),
        ),
      ],
    );
  }
}
