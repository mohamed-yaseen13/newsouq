import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/states/states.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/features/login/presentation/cubit/login_cubit.dart';
import 'package:newsouq/features/login/presentation/cubit/login_state.dart';
import 'package:newsouq/features/login/presentation/widgets/dont_have_account_text.dart';
import 'package:newsouq/features/login/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            switch (state) {
              case LoginLoading _:
                loadingState(context: context);

              case LoginError _:
                Navigator.of(context, rootNavigator: true).pop();
                errorState(
                  context: context,
                  desc: 'Login Failed',
                  message: state.apiErrorModel.message!,
                );

              case LoginSuccess _:
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
                      'Login to your Account',
                      style: AppTextStyles.blackColor32FontSizeSemibold,
                    ),
                    verticalSpace(4),
                    Text(
                      "It's great to see you again.",
                      style: AppTextStyles.gray5Color16FontSizeRegular,
                    ),
                    verticalSpace(24),
                    LoginForm(),
                    verticalSpace(64),
                    DontHaveAccountText(),
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
