import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/core/widgets/app_button.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeForm extends StatefulWidget {
  final String email;

  const VerificationCodeForm({super.key, required this.email});

  @override
  State<VerificationCodeForm> createState() => _VerificationCodeFormState();
}

class _VerificationCodeFormState extends State<VerificationCodeForm> {
  late String otp;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Pinput(
          length: 4,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          showCursor: true,
          separatorBuilder: (index) => horizontalSpace(12),
          onCompleted: (value) => setState(() => otp = value),
        ),
        verticalSpace(64),
        AppButton(
          desc: 'Continue',
          onPressed: () {
            context.read<ResetPasswordCubit>().checkIfOtpCorrect(
              widget.email,
              otp,
            );
          },
          descStyle: AppTextStyles.whiteColor16FontSizeMedium,
        ),
      ],
    );
  }
}
