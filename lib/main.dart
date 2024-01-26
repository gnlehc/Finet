import 'package:finet/pages/home.dart';
import 'package:finet/user_auth/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:finet/pages/login.dart';
import 'package:finet/pages/register.dart';
import 'package:finet/pages/introduction.dart';
import 'package:flutter/material.dart';
import 'package:finet/pages/splashscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyCmqiFH0vsuTfLs-fwbDVoDZL4kpAarsdg",
    appId: "1:754197928310:web:bd8025ed5fd1b7ac0b0257",
    messagingSenderId: "754197928310",
    projectId: "finet-e3fa2",
  ));
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/introduction': (context) => Introduction(),
          '/login': (context) => const LoginForm(),
          '/register': (context) => const RegisterForm(),
          '/home': (context) => Home()
        });
  }
}
