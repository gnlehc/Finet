import 'package:finet/firebase_options.dart';
import 'package:finet/middleware/auth_middleware.dart';
import 'package:finet/pages/home.dart';
import 'package:finet/user_auth/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:finet/pages/login.dart';
import 'package:finet/pages/register.dart';
import 'package:finet/pages/introduction.dart';
import 'package:flutter/material.dart';
import 'package:finet/pages/splashscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          page: () => const Home(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginForm(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/register',
          page: () => const RegisterForm(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
            name: '/introduction',
            page: () => Introduction(),
            middlewares: [AuthMiddleware()])
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
