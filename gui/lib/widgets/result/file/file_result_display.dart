import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:swan_classifier/bloc/classifier_bloc.dart';
import 'package:swan_classifier/bloc/classifier_state.dart';
import 'package:swan_classifier/widgets/generic/dashed_border.dart';

class FileResultDisplay extends StatelessWidget {
  const FileResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ClassifierBloc>().state as FileResult;
    final result = state.result;

    final colorScheme = Theme.of(context).colorScheme;
    final primaryColor = colorScheme.primary;

    return DashedBorder(
      child: Column(
        children: [
          Text(
            '''
Обнаружено лебедей: ${result.total}

Кликунов: ${result.klikun}
Малых: ${result.maliy}
Шипунов: ${result.shipun}
''',
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'PTMonoBold',
            ),
          ),
          Expanded(
            child: PieChart(
              dataMap: {
                'Кликун': result.klikun.toDouble(),
                'Малый': result.maliy.toDouble(),
                'Шипун': result.shipun.toDouble(),
              },
              colorList: [
                primaryColor,
                primaryColor.withOpacity(0.5),
                primaryColor.withOpacity(0.3),
              ],
              chartValuesOptions: const ChartValuesOptions(
                showChartValues: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
