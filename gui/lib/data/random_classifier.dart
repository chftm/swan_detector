import 'dart:io';
import 'dart:math';

import 'package:swan_classifier/data/models/file_classification_result.dart';

class RandomClassifier {
  static final _rnd = Random();

  static int get _randomValue => _rnd.nextInt(20);

  static Future<FileClassificationResult> classify(File _) async {
    return FileClassificationResult(
      klikun: _randomValue,
      shipun: _randomValue,
      maliy: _randomValue,
    );
  }
}
