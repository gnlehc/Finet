import 'package:finet/widgets/pages/login.dart';
import 'package:finet/widgets/pages/register.dart';
import 'package:finet/widgets/splashscreen/introduction.dart';
import 'package:flutter/material.dart';
import 'package:finet/widgets/splashscreen/splashscreen.dart';

final emailController = TextEditingController();
final usernameController = TextEditingController();
final passwordController = TextEditingController();
final confirmedPasswordController = TextEditingController();
void main() {
  runApp(MyApp());
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
        });
  }
}
