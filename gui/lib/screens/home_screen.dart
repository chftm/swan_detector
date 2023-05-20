import 'package:flutter/material.dart';
import 'package:swan_classifier/screens/screen_layout.dart';
import 'package:swan_classifier/widgets/generic/dashed_border.dart';
import 'package:swan_classifier/widgets/generic/line_border.dart';
import 'package:swan_classifier/widgets/home/drop_target.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      top: DropTarget(),
      bottom: DashedBorder(
        child: Text(
          'Здесь будет информация о загруженном файле!',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'PTMonoBold',
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ),
      right: LineBorder(
        child: Center(
          child: Text(
            'Для начала работы загрузите файл/папку в окно слева. '
            'Дождитесь окончания загрузки и следите за этим окном!',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'PTMonoBold',
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        ),
      ),
    );
  }
}
