import 'dart:io';

import 'package:finet/firebase_options.dart';
import 'package:finet/middleware/auth_middleware.dart';
import 'package:finet/pages/homePage.dart';
import 'package:finet/pages/loginPage.dart';
import 'package:finet/pages/registerPage.dart';
import 'package:finet/user_auth/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:finet/widgets/loginForm.dart';
import 'package:finet/widgets/registerForm.dart';
import 'package:finet/pages/introductionPage.dart';
import 'package:flutter/material.dart';
import 'package:finet/pages/splashscreenPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      home: SplashScreen(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
          // middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/register',
          page: () => const RegisterPage(),
          // middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/introduction',
          page: () => IntroductionPage(),
          // middlewares: [AuthMiddleware()]
        )
      ],
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/introduction': (context) => Introduction(),
      //   '/login': (context) => const LoginForm(),
      //   '/register': (context) => const RegisterForm(),
      //   '/home': (context) => Home()
      // });
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
