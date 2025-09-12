import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/di/di.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';
import 'package:newsouq/features/home/presentation/screens/home_screen.dart';
import 'package:newsouq/features/login/presentation/cubit/login_cubit.dart';
import 'package:newsouq/features/login/presentation/screens/login_screen.dart';
import 'package:newsouq/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:newsouq/features/reset_password/presentation/screens/confirm_reset_password_code_screen.dart';
import 'package:newsouq/features/reset_password/presentation/screens/forgot_password_screen.dart';
import 'package:newsouq/features/reset_password/presentation/screens/reset_password_screen.dart';
import 'package:newsouq/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:newsouq/features/signup/presentation/screens/signup_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignupScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()
              ..getCategories()
              ..getProducts(),
            child: HomeScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ForgotPasswordScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.confirmResetPasswordCodeScreen:
        final args = settings.arguments as Map<String, String?>;
        final email = args['email'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ConfirmResetPasswordCodeScreen(email: email!),
          ),
          settings: settings,
        );

      case AppRoutes.resetPasswordScreen:
        final args = settings.arguments as Map<String, String?>;
        final email = args['email'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ResetPasswordScreen(email: email!),
          ),
          settings: settings,
        );

      case AppRoutes.notificationsScreen:
        return MaterialPageRoute(
          builder: (_) => NotificationsScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
