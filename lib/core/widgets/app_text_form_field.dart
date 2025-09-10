import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final String? placeholder;
  final FormFieldValidator<String>? validator;
  final Color? borderColor;
  final bool isObscureText;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.textInputType,
    this.suffixIcon,
    this.placeholder,
    this.validator,
    this.borderColor,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = borderColor ?? AppColors.gray1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.blackColor16FontSizeMedium),
        verticalSpace(4),
        TextFormField(
          obscureText: isObscureText,
          keyboardType: textInputType,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor, width: 2.w),
              borderRadius: BorderRadius.circular(12.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor, width: 2.w),
              borderRadius: BorderRadius.circular(12.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 2.w),
              borderRadius: BorderRadius.circular(12.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 2.w),
              borderRadius: BorderRadius.circular(12.r),
            ),
            suffixIcon: suffixIcon,
            hintText: placeholder,
            hintStyle: AppTextStyles.gray4Color16FontSizeRegular,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
