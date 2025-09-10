import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/styles/app_colors.dart';

class AppTextStyles {
  static TextStyle blackColor32FontSizeSemibold = TextStyle(
    fontSize: 32.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle gray5Color16FontSizeRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.gray5,
  );

  static TextStyle gray4Color16FontSizeRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.gray4,
  );

  static TextStyle blackColor16FontSizeMedium = TextStyle(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blackColor16FontSizeMediumUnderline = TextStyle(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static TextStyle whiteColor16FontSizeMedium = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
}
