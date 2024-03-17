import 'dart:io';

import 'package:finet/firebase_options.dart';
import 'package:finet/views/pages/expenses/add_expenses_page.dart';
import 'package:finet/views/pages/home_page.dart';
import 'package:finet/views/pages/login_page.dart';
import 'package:finet/views/pages/register_page.dart';
import 'package:finet/user_auth/user_provider.dart';
import 'package:finet/views/pages/splashscreen_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:finet/views/pages/introduction_page.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'DMSans',
        textTheme: const TextTheme(),
      ),
      initialRoute: '/',
      home: const HomePage(),
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
        ),
        GetPage(name: '/add-expenses', page: () => const AddExpensesPage()),
      ],
      debugShowCheckedModeBanner: false,
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
