import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: colorScheme.primary,
        ),
      ),
      backgroundColor: colorScheme.background,
    );
  }
}
