import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:newsouq/features/signup/presentation/cubit/signup_state.dart';
import 'package:newsouq/features/signup/presentation/widgets/already_have_account_text.dart';
import 'package:newsouq/features/signup/presentation/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupLoading) {
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
            if (state is SignupError) {
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
            if (state is SignupSuccess) {
              Navigator.of(context, rootNavigator: true).pop();
              context.pushReplacementNamed(AppRoutes.homeScreen);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create an account',
                      style: AppTextStyles.blackColor32FontSizeSemibold,
                    ),
                    verticalSpace(4),
                    Text(
                      "Let's create your account.",
                      style: AppTextStyles.gray5Color16FontSizeRegular,
                    ),
                    verticalSpace(24),
                    SignupForm(),
                    verticalSpace(64),
                    Center(child: AlreadyHaveAccountText()),
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
