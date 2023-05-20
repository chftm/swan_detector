import 'package:flutter/material.dart';
import 'package:swan_classifier/screens/screen_layout.dart';
import 'package:swan_classifier/widgets/result/file/file_info_row.dart';
import 'package:swan_classifier/widgets/result/file/file_result_display.dart';
import 'package:swan_classifier/widgets/result/file/image_display.dart';

class FileResultScreen extends StatelessWidget {
  const FileResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      top: ImageDisplay(),
      bottom: FileInfoRow(),
      right: FileResultDisplay(),
    );
  }
}
