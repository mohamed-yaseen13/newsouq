import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/widgets/app_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordTextFormField({super.key, required this.passwordController});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isObscureText = true;
  bool? isValid;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.passwordController,
      label: "Password",
      placeholder: "Enter Your Password",
      validator: (value) {
        if (value.isNullOrEmpty() || value!.length < 8) {
          setState(() {
            isValid = false;
          });
          return "Password should be at least 8 characters";
        }
        setState(() {
          isValid = true;
        });
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
