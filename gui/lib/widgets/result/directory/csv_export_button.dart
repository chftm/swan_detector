import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swan_classifier/bloc/classifier_bloc.dart';
import 'package:swan_classifier/bloc/classifier_state.dart';
import 'package:swan_classifier/data/models/directory_classification_result.dart';
import 'package:swan_classifier/data/models/file_classification_result.dart';
import 'package:swan_classifier/widgets/generic/button.dart';

class CsvExportButton extends StatelessWidget {
  const CsvExportButton({super.key});

  Iterable<List<Object>> _generateFileList(
    Map<Uri, FileClassificationResult> files,
  ) {
    return files.entries.map(
      (entry) => [
        entry.key.pathSegments.last,
        entry.value.klikun,
        entry.value.maliy,
        entry.value.shipun,
        entry.value.total,
      ],
    );
  }

  List<List<Object>> _generateCsvData(DirectoryClassificationResult result) {
    return [
      [
        'Файл',
        'Кликун',
        'Малый',
        'Шипун',
        'Всего',
      ],
      ..._generateFileList(result.files),
      [
        'Всего',
        result.klikunTotal,
        result.maliyTotal,
        result.shipunTotal,
        result.total,
      ],
    ];
  }

  Future<void> _saveCsv(DirectoryClassificationResult result) async {
    final data = _generateCsvData(result);
    final csv = const ListToCsvConverter().convert(
      data,
      fieldDelimiter: ';',
    );
    await FileSaver.instance.saveFile(
      name: 'result',
      ext: 'csv',
      bytes: Uint8List.fromList(utf8.encode(csv)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ClassifierBloc>().state as DirectoryResult;
    final result = state.result;

    return Button(
      onPressed: () => _saveCsv(result),
      text: 'Скачать',
    );
  }
}
