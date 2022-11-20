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
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/drawer_image.png'),
                fit: BoxFit.fill)),
        child: const Center(
          child: Text(
            "Welcome to MyProject",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
