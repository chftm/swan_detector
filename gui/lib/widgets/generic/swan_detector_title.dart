import 'package:flutter/material.dart';

class SwanDetectorTitle extends StatelessWidget {
  const SwanDetectorTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Text(
        'Swan detector',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
