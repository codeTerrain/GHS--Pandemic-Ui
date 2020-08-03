import 'package:ghspandemic/ui/views/Login.dart';
import 'package:ghspandemic/ui/shared/spacing.dart';
import 'package:flutter/material.dart';
import 'package:ghspandemic/ui/views/homepage.dart';
import 'package:ghspandemic/ui/views/traceMe.dart';
import 'package:ghspandemic/ui/views/signup.dart';
import 'package:ghspandemic/ui/views/connect.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case '/homepage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/traceMe':
        return MaterialPageRoute(builder: (_) => TraceMe());
      case '/connect':
        return MaterialPageRoute(builder: (_) => Connect());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          UiSpacing.verticalSpacingMedium(),
                          Image.asset(
                            'assets/images/auccLogo.png',
                            scale: 5,
                          ),
                          Text('Page Not found'),
                        ],
                      ),
                    ),
                  ),
                ));
    }
  }
}
