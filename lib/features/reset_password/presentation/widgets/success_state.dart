import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/core/widgets/app_button.dart';

void successState(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(18.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/Check-duotone.svg'),
              verticalSpace(16),
              Text(
                'Password Changed',
                style: AppTextStyles.blackColor20FontSizeSemibold,
              ),
              verticalSpace(4),
              Text(
                'Your can now use your new password to login to your account.',
                style: AppTextStyles.gray5Color16FontSizeRegular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(16),
              AppButton(
                desc: 'Login',
                onPressed: () {
                  context.pushReplacementNamed(AppRoutes.loginScreen);
                },
                descStyle: AppTextStyles.whiteColor16FontSizeMedium,
              ),
            ],
          ),
        ),
      );
    },
  );
}
