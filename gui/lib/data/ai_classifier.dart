import 'dart:io';

import 'package:swan_classifier/data/ai_client.dart';
import 'package:swan_classifier/data/models/file_classification_result.dart';

class AiClassifier {
  static final AIClient aiClient = AIClient()
    ..initialize(
      'python',
      'python/client.py',
      true,
    );

  static Future<FileClassificationResult> classify(File file) async {
    final result = await aiClient.predict(file.path);

    return FileClassificationResult(
      klikun: result['кликун']! as int,
      shipun: result['щипун']! as int,
      maliy: result['малый']! as int,
    );
  }
}
