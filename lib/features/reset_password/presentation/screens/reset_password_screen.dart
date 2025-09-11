import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/core/widgets/app_button.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:newsouq/features/reset_password/presentation/widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(24.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  );
                },
              );
            }
            if (state is ResetPasswordError) {
              Navigator.of(context, rootNavigator: true).pop();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Signup Failed"),
                  content: Text(state.apiErrorModel.message!),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            }
            if (state is ResetPasswordSuccess) {
              Navigator.of(context, rootNavigator: true).pop();
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
                              context.pushReplacementNamed(
                                AppRoutes.loginScreen,
                              );
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
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset('assets/icons/Arrow.svg'),
                    ),
                    verticalSpace(12),
                    Text(
                      'Reset Password',
                      style: AppTextStyles.blackColor32FontSizeSemibold,
                    ),
                    verticalSpace(4),
                    Text(
                      'Set the new password for your account so you can login and access all the features.',
                      style: AppTextStyles.gray4Color16FontSizeRegular,
                    ),
                    verticalSpace(24),
                    ResetPasswordForm(email: email),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
