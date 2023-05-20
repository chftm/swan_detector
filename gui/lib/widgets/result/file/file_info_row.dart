import 'package:flutter/material.dart';
import 'package:swan_classifier/widgets/result/file/file_info.dart';
import 'package:swan_classifier/widgets/result/info_back_button.dart';

class FileInfoRow extends StatelessWidget {
  const FileInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: FileInfo()),
          SizedBox(width: 35),
          Expanded(child: InfoBackButton()),
        ],
      ),
    );
  }
}
