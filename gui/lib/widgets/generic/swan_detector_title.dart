import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SwanDetectorTitle extends StatelessWidget {
  const SwanDetectorTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final dimmedColor = Theme.of(context).colorScheme.primary.withOpacity(0.3);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'Swan detector',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'made by',
                style: TextStyle(
                  color: dimmedColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 10),
              SvgPicture.asset(
                'assets/icons/logo.svg',
                height: 25,
                colorFilter: ColorFilter.mode(
                  dimmedColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
