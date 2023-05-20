import 'package:flutter/material.dart';
import 'package:swan_classifier/widgets/result/directory/directory_info.dart';
import 'package:swan_classifier/widgets/result/info_back_button.dart';

class DirectoryInfoRow extends StatelessWidget {
  const DirectoryInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: DirectoryInfo()),
          SizedBox(width: 35),
          Expanded(child: InfoBackButton()),
        ],
      ),
    );
  }
}
