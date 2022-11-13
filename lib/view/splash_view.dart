import 'package:flutter/material.dart';
import 'package:mvvm_task/view_model/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    SplashService().checkerAuth(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Welcome to MyProject",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
