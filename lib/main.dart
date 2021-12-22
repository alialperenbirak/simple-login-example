import 'package:flutter/material.dart';
import 'package:simple_login_example/core/auth_manager.dart';
import 'package:simple_login_example/splash/splash_view.dart';
import 'package:provider/provider.dart';
import 'login/login.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<AuthenticationManager>(
        create: (context) => AuthenticationManager(context: context),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashView(),
    );
  }
}
