import 'package:flutter/material.dart';
import 'package:ghspandemic/ui/views/Login.dart';

import 'Router.dart';
import 'core/services/dialog_service.dart';
import 'core/services/navigation_service.dart';
import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'ui/shared/theme.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      title: 'aucc',
      onGenerateRoute: Router.generateRoute,
      theme: themeData,
      home: LoginScreen(),
    );
  }
}
