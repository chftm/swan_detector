import 'package:flutter/material.dart';
import 'package:swan_classifier/screens/screen_layout.dart';
import 'package:swan_classifier/widgets/generic/line_border.dart';
import 'package:swan_classifier/widgets/result/directory/directory_info_row.dart';
import 'package:swan_classifier/widgets/result/directory/directory_result_display.dart';

class DirectoryResultScreen extends StatelessWidget {
  const DirectoryResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      top: LineBorder(
        child: Image.asset('assets/icons/folder.png'),
      ),
      bottom: const DirectoryInfoRow(),
      right: const DirectoryResultDisplay(),
    );
  }
}
