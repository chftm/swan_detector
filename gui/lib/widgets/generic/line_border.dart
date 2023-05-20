import 'package:flutter/material.dart';

class LineBorder extends StatelessWidget {
  final Widget child;

  final bool padding;

  const LineBorder({
    required this.child,
    this.padding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const borderWidth = 5.0;
    const borderOpacity = 0.3;

    return Container(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(borderOpacity),
            width: borderWidth,
          ),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(padding ? 17.5 : 0),
        child: child,
      ),
    );
  }
}
