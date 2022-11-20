import 'package:flutter/material.dart';
import 'package:mvvm_task/view/home_view.dart';

import '../view/login_view.dart';
import 'shared_pref_model.dart';

class SplashService {
  Future<void> checkerAuth(context) async {
    String? hello = await UserView().getToekn();
    if (hello == null) {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Todohome()),
          (Route<dynamic> route) => false);
    }
  }
}
