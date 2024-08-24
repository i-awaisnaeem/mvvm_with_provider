import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/Login_view.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.HomeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case RouteName.LoginScreen:
        return MaterialPageRoute(builder: (context) => LoginView());

      case RouteName.SignupScreen:
        return MaterialPageRoute(builder: (context) => SignupView());

      case RouteName.SplashView:
        return MaterialPageRoute(builder: (context) => SplashView());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          );
        });
    }
  }
}
