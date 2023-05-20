import 'dart:io';

import 'package:swan_classifier/data/models/directory_classification_result.dart';
import 'package:swan_classifier/data/models/file_classification_result.dart';

sealed class ClassifierState {}

class WaitingForFiles extends ClassifierState {}

class Processing extends ClassifierState {}

class FileResult extends ClassifierState {
  final File file;
  final FileClassificationResult result;

  FileResult(this.file, this.result);
}

class DirectoryResult extends ClassifierState {
  final Directory directory;
  final DirectoryClassificationResult result;

  DirectoryResult(this.directory, this.result);
}
