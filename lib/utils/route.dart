import 'package:flutter/material.dart';
import 'package:mvvm_task/utils/routes_name.dart';
import 'package:mvvm_task/view/home_view.dart';

import '../view/login_view.dart';
import '../view/save_view.dart';
import '../view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pathname.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case Pathname.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Login_Screen());
      case Pathname.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Todohome());
      case Pathname.save:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Savetask());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
