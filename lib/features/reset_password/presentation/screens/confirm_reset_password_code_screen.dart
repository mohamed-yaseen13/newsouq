import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/states/states.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:newsouq/features/reset_password/presentation/widgets/verification_code_form.dart';

class ConfirmResetPasswordCodeScreen extends StatelessWidget {
  final String email;

  const ConfirmResetPasswordCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            switch (state) {
              case ResetPasswordLoading _:
                loadingState(context: context);

              case ResetPasswordError _:
                Navigator.of(context, rootNavigator: true).pop();
                errorState(
                  context: context,
                  desc: "Reset Password Failed",
                  message: state.apiErrorModel.message!,
                );

              case ResetPasswordSuccess _:
                Navigator.of(context, rootNavigator: true).pop();
                context.pushNamed(
                  AppRoutes.resetPasswordScreen,
                  arguments: {'email': state.email},
                );

              default:
                return;
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
                      'Enter 4 Digit Code',
                      style: AppTextStyles.blackColor32FontSizeSemibold,
                    ),
                    verticalSpace(4),
                    Text(
                      'Enter 4 digit code that your receive on your email ($email).',
                      style: AppTextStyles.gray4Color16FontSizeRegular,
                    ),
                    verticalSpace(24),
                    VerificationCodeForm(email: email),
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
