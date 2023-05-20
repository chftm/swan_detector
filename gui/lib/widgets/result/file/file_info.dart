import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swan_classifier/bloc/classifier_bloc.dart';
import 'package:swan_classifier/bloc/classifier_state.dart';
import 'package:swan_classifier/widgets/generic/line_border.dart';

class FileInfo extends StatelessWidget {
  const FileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ClassifierBloc>().state as FileResult;
    final file = state.file;

    return LineBorder(
      child: Column(
        children: [
          Text(
            file.uri.pathSegments.last,
            style: const TextStyle(
              fontFamily: 'PTMonoBold',
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            filesize(file.lengthSync()),
            style: const TextStyle(
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
