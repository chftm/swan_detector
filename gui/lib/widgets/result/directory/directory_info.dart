import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swan_classifier/bloc/classifier_bloc.dart';
import 'package:swan_classifier/bloc/classifier_state.dart';
import 'package:swan_classifier/widgets/generic/line_border.dart';

class DirectoryInfo extends StatelessWidget {
  const DirectoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ClassifierBloc>().state as DirectoryResult;
    final directory = state.directory;

    final pathSegments = directory.uri.pathSegments;

    return LineBorder(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            pathSegments[pathSegments.length - 2],
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'PTMonoBold',
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            filesize(directory.statSync().size),
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'PTMonoBold',
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
