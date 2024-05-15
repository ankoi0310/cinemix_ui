import 'package:flutter/material.dart';

class CircleLoading extends StatelessWidget {
  const CircleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      type: MaterialType.transparency,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
