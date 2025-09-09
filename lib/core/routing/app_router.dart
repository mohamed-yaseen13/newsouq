import 'package:flutter/material.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/features/signup/signup_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
