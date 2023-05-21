import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swan_classifier/bloc/classifier_bloc.dart';
import 'package:swan_classifier/bloc/classifier_state.dart';
import 'package:swan_classifier/widgets/generic/dashed_border.dart';
import 'package:swan_classifier/widgets/result/directory/csv_export_button.dart';

class DirectoryResultDisplay extends StatelessWidget {
  const DirectoryResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ClassifierBloc>().state as DirectoryResult;
    final result = state.result;

    return DashedBorder(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '''
Всего фото: ${result.files.length}
Всего лебедей: ${result.total}

Кликунов: ${result.klikunTotal}
Малых: ${result.maliyTotal}
Шипунов: ${result.shipunTotal}
''',
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'PTMonoBold',
            ),
            textAlign: TextAlign.center,
          ),
          const CsvExportButton(),
        ],
      ),
    );
  }
}
