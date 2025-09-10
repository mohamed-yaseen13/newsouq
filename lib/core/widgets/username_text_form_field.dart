import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/widgets/app_text_form_field.dart';

class UsernameTextFormField extends StatefulWidget {
  final TextEditingController nameController;

  const UsernameTextFormField({super.key, required this.nameController});

  @override
  State<UsernameTextFormField> createState() => _UsernameTextFormFieldState();
}

class _UsernameTextFormFieldState extends State<UsernameTextFormField> {
  bool? isValid;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.nameController,
      label: "Username",
      placeholder: 'Enter You Name',
      validator: (value) {
        if (value.isNullOrEmpty() || value!.length < 3) {
          setState(() {
            isValid = false;
          });
          return "user name should be at least 3 characters";
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
