import 'package:flutter/material.dart';
import 'package:swan_classifier/screens/page_router.dart';

class SwanClassifier extends StatelessWidget {
  const SwanClassifier({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PageRouter(),
      title: 'Swan detector',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF23dd83),
          background: Color(0xFF00212e),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xFF23dd83),
              fontFamily: 'Unbounded',
              displayColor: const Color(0xff22215B),
            ),
      ),
    );
  }
}
