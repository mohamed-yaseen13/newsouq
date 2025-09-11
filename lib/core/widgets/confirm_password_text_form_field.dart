import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/widgets/app_text_form_field.dart';

class ConfirmPasswordTextFormField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const ConfirmPasswordTextFormField({
    super.key,
    required this.confirmPasswordController,
    required this.passwordController,
  });

  @override
  State<ConfirmPasswordTextFormField> createState() =>
      _ConfirmPasswordTextFormFieldState();
}

class _ConfirmPasswordTextFormFieldState
    extends State<ConfirmPasswordTextFormField> {
  bool isObscureText = false;
  bool? isValid;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.confirmPasswordController,
      label: "Confirm Password",
      placeholder: "Re-enter Your Password",
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() => isValid = false);
          return "Please confirm your password";
        }
        if (value != widget.passwordController.text) {
          setState(() => isValid = false);
          return "Passwords do not match";
        }
        setState(() => isValid = true);
        return null;
      },
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObscureText = !isObscureText;
          });
        },
        icon: Padding(
          padding: EdgeInsetsGeometry.all(4.sp),
          child: SvgPicture.asset(
            isObscureText ? 'assets/icons/eye-off.svg' : 'assets/icons/Eye.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
      isObscureText: isObscureText,
      borderColor: isValid == null
          ? null
          : isValid!
          ? AppColors.green
          : AppColors.red,
    );
  }
}
