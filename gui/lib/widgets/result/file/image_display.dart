import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swan_classifier/bloc/classifier_bloc.dart';
import 'package:swan_classifier/bloc/classifier_state.dart';
import 'package:swan_classifier/widgets/generic/line_border.dart';

class ImageDisplay extends StatelessWidget {
  const ImageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ClassifierBloc>().state as FileResult;
    final image = state.file;

    return LineBorder(
      padding: false,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: FittedBox(
          fit: BoxFit.cover,
          clipBehavior: Clip.hardEdge,
          child: Image.file(
            image,
          ),
        ),
      ),
    );
  }
}
