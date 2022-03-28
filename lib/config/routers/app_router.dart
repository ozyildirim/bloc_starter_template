import 'package:flutter/material.dart';

import '../../core/auth/view/screens/sign_in_screen.dart';
import '../../core/auth/view/screens/sign_up_screen.dart';
import '../../core/settings/view/screens/settings_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );

      case '/signup':
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );

      case '/login':
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );

      case '/settings':
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );

      default:
        return null;
    }
  }
}
