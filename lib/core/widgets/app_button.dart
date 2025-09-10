import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/styles/app_colors.dart';

class AppButton extends StatelessWidget {
  final String desc;
  final VoidCallback onPressed;
  final TextStyle descStyle;

  const AppButton({
    super.key,
    required this.desc,
    required this.onPressed,
    required this.descStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        minimumSize: Size(350.w, 60.h),
      ),
      onPressed: onPressed,
      child: Text(desc, style: descStyle),
    );
  }
}
