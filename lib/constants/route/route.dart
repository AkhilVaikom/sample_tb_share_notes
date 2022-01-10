import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/route/route_exception.dart';
import 'package:tb_share_notes/screens/home/home_screen.dart';
import 'package:tb_share_notes/screens/login/login_screen.dart';
import 'package:tb_share_notes/screens/sharenotes/add_notes/add_share_notes.dart';
//import 'package:tb_share_notes/screens/sharenotes/view_notes/view_share_notes.dart';
import 'package:tb_share_notes/screens/signup/signup_screen.dart';
import 'package:tb_share_notes/screens/splash_screen/splash_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String addNote = '/addNote';
  static const String editNote = '/editNote';
  static const String viewNote = '/viewNote';
  static const String splash = '/splash';
  // static const String addNote ='/addNote';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case signup:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case addNote:
        return MaterialPageRoute(
          builder: (_) =>  AddNotesScreen(),
        );
      case viewNote:
      // return MaterialPageRoute(
      //   builder: (_) => const ViewNotesScreen(title: '',),
      // );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
