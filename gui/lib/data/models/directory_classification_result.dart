import 'package:swan_classifier/data/models/file_classification_result.dart';

class DirectoryClassificationResult {
  Map<Uri, FileClassificationResult> files;

  int get klikunTotal =>
      files.values.fold(0, (value, file) => value + file.klikun);

  int get shipunTotal =>
      files.values.fold(0, (value, file) => value + file.shipun);

  int get maliyTotal =>
      files.values.fold(0, (value, file) => value + file.maliy);

  int get total => klikunTotal + shipunTotal + maliyTotal;

  DirectoryClassificationResult(this.files);
}
