import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swan_classifier/bloc/classifier_bloc.dart';
import 'package:swan_classifier/bloc/classifier_state.dart';
import 'package:swan_classifier/data/random_classifier.dart';
import 'package:swan_classifier/screens/directory_result_screen.dart';
import 'package:swan_classifier/screens/file_result_screen.dart';
import 'package:swan_classifier/screens/home_screen.dart';
import 'package:swan_classifier/screens/loading_screen.dart';

class PageRouter extends StatelessWidget {
  const PageRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClassifierBloc(RandomClassifier.classify),
      child: BlocConsumer<ClassifierBloc, ClassifierState>(
        builder: (_, state) => switch (state) {
          WaitingForFiles() => const HomeScreen(),
          Processing() => const LoadingScreen(),
          FileResult() => const FileResultScreen(),
          DirectoryResult() => const DirectoryResultScreen(),
        },
        listener: (_, state) => print(state),
      ),
    );
  }
}
