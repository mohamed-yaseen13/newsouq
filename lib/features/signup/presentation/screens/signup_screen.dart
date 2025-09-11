import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/states/states.dart';
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
            switch (state) {
              case SignupLoading _:
                return loadingState(context: context);

              case SignupError _:
                Navigator.of(context, rootNavigator: true).pop();
                return errorState(
                  context: context,
                  desc: 'Signup Failed',
                  message: state.apiErrorModel.message!,
                );

              case SignupSuccess _:
                Navigator.of(context, rootNavigator: true).pop();
                context.pushReplacementNamed(AppRoutes.homeScreen);

              default:
                return;
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
