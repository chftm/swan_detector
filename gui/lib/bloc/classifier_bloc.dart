import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swan_classifier/bloc/classifier_event.dart';
import 'package:swan_classifier/bloc/classifier_state.dart';
import 'package:swan_classifier/data/models/directory_classification_result.dart';
import 'package:swan_classifier/data/models/file_classification_result.dart';

class ClassifierBloc extends Bloc<ClassifierEvent, ClassifierState> {
  final Future<FileClassificationResult> Function(File file) classify;

  ClassifierBloc(this.classify) : super(WaitingForFiles()) {
    on<ClassifierEvent>(
      (event, emit) async {
        switch (event) {
          case UploadFile():
            await _processFiles(event.fileUri, emit);
          case Back():
            emit(WaitingForFiles());
        }
      },
      transformer: restartable(),
    );
  }

  Future<void> _processFiles(Uri fileUri, Emitter<ClassifierState> emit) async {
    emit(Processing());

    final file = File.fromUri(fileUri);
    final directory = Directory.fromUri(fileUri);

    if (file.existsSync()) {
      final result = await classify(file);
      emit(FileResult(file, result));
    } else if (directory.existsSync()) {
      final result = await _classifyDirectory(directory);
      emit(DirectoryResult(directory, result));
    } else {
      emit(WaitingForFiles());
    }
  }

  Future<DirectoryClassificationResult> _classifyDirectory(
    Directory directory,
  ) async {
    final files = directory.listSync(recursive: true).whereType<File>();

    final result = <Uri, FileClassificationResult>{};
    for (final file in files) {
      final classifyResult = await classify(file);
      result.putIfAbsent(file.uri, () => classifyResult);
    }

    return DirectoryClassificationResult(result);
  }
}
