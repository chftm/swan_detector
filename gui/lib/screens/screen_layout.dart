import 'package:flutter/material.dart';
import 'package:swan_classifier/widgets/generic/swan_detector_title.dart';

class ScreenLayout extends StatelessWidget {
  static const routeName = '/home';

  final Widget top;
  final Widget bottom;
  final Widget right;

  const ScreenLayout({
    required this.top,
    required this.bottom,
    required this.right,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(17.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(17.5),
                      child: top,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.5),
                    child: bottom,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(17.5),
                    child: SwanDetectorTitle(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(17.5),
                      child: right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
