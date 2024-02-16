import 'package:finet/widgets/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:finet/widgets/finetbackground.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        FinetBackground(),
        Positioned(
          top: 80.0,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            child: LoginForm(),
          ),
        )
      ],
    );
  }
}
