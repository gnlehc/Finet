import 'package:flutter/material.dart';

class FinetBackground extends StatelessWidget {
  const FinetBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF438BEF),
              Color(0xFF4C4BF3),
            ],
          ),
        ),
      ),
    );
  }
}
