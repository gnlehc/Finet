import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String assetPath;
  final double size;

  ImageWidget({required this.assetPath, required this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
