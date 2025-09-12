import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/constants/app_constants.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/core/widgets/app_navigation_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(
        selectedScreen: NavigationBarEnum.home,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset('assets/icons/Arrow.svg'),
                  ),
                  Text(
                    'Notifications',
                    style: AppTextStyles.blackColor32FontSizeSemibold,
                  ),
                  SvgPicture.asset('assets/icons/Bell.svg'),
                ],
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/Bell-duotone.svg'),
                      verticalSpace(6),
                      Text(
                        "You haven't gotten any notifications yet!",
                        style: AppTextStyles.blackColor20FontSizeSemibold,
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(6),
                      Text(
                        "We'll alert you when something cool happens.",
                        style: AppTextStyles.gray5Color16FontSizeRegular,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
