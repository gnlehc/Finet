import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print('User is already signed in, redirecting to home page.');
      return const RouteSettings(name: '/home');
    } else {
      print('User is not signed in, allowing normal navigation.');
      return null;
    }
  }
}
