import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/di/di.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/features/home/home_screen.dart';
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
          builder: (_) => HomeScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
