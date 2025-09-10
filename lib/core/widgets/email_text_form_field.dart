import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/widgets/app_text_form_field.dart';

class EmailTextFormField extends StatefulWidget {
  final TextEditingController emailController;

  const EmailTextFormField({super.key, required this.emailController});

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  bool? isValid;
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.emailController,
      label: 'Email',
      placeholder: "Enter Your Email",
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isNullOrEmpty()) {
          setState(() {
            isValid = false;
          });
          return "Enter Your Email";
        } else if (!emailRegex.hasMatch(value!)) {
          setState(() {
            isValid = false;
          });
          return 'Enter a valid email';
        }
        setState(() {
          isValid = true;
        });
        return null;
      },
      suffixIcon: isValid == null
          ? null
          : Padding(
              padding: EdgeInsetsGeometry.all(12.sp),
              child: SvgPicture.asset(
                isValid!
                    ? 'assets/icons/Check.svg'
                    : 'assets/icons/WarningCircle.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
      borderColor: isValid == null
          ? null
          : isValid!
          ? AppColors.green
          : AppColors.red,
    );
  }
}
