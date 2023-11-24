import 'package:flutter/material.dart';
import 'package:session7test/features/auth/ui/screens/login_screen.dart';
import 'package:session7test/features/auth/ui/screens/reset_password_screen.dart';
import 'package:session7test/features/auth/ui/screens/register_screen.dart';
import 'package:session7test/ui/screens/home_layout.dart';
import 'package:session7test/ui/screens/posts_screen.dart';
import 'package:session7test/ui/screens/splash_screen.dart';


class Routes {
  static const String layout = "/layout";
  static const String splash = "/splashScreen";
  static const String login = "/login";
  static const String resetPassword = "/resetPassword";
  static const String register = "/register";
  static const String home = "/home";
  static const String profile = "/profile";
}

Route? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.layout:
      return MaterialPageRoute(
        builder: (_) => const HomeLayout(),
      );
    case Routes.splash:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case Routes.resetPassword:
      return MaterialPageRoute(
        builder: (_) => const ResetPasswordScreen(),
      );
    case Routes.register:
      return MaterialPageRoute(
        builder: (_) => const RegisterScreen(),
      );
    case Routes.home:
      return MaterialPageRoute(
        builder: (_) => const PostsScreen(),
      );
    default:
      return null;
  }
}
