import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_task/utils/route.dart';
import 'package:mvvm_task/utils/routes_name.dart';
import 'package:mvvm_task/view_model/auth_view_model.dart';
import 'package:mvvm_task/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginAuth()),
        ChangeNotifierProvider(create: (_) => Homeview())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Pathname.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
