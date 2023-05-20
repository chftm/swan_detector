import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DashedBorder extends StatelessWidget {
  final Widget child;

  const DashedBorder({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const borderWidth = 5.0;
    const dashPattern = <double>[15, 15];

    return DottedBorder(
      color: Theme.of(context).colorScheme.primary,
      strokeWidth: borderWidth,
      dashPattern: dashPattern,
      padding: const EdgeInsets.all(17.5),
      child: SizedBox(
        width: double.infinity,
        child: child,
      ),
    );
  }
}
