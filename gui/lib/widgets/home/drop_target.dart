import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:swan_classifier/bloc/classifier_bloc.dart';
import 'package:swan_classifier/bloc/classifier_event.dart';
import 'package:swan_classifier/widgets/generic/dashed_border.dart';

class DropTarget extends StatelessWidget {
  const DropTarget({super.key});

  // The async keyboard is needed because onPerformDrop expects Future<void>.
  // ignore: avoid-redundant-async
  Future<void> onPerformDrop(
    PerformDropEvent event,
    BuildContext context,
  ) async {
    final item = event.session.items.first;
    final reader = item.dataReader!;

    final bloc = context.read<ClassifierBloc>();

    if (reader.canProvide(Formats.fileUri)) {
      // The read progress is not relevant.
      // ignore: avoid-ignoring-return-values
      reader.getValue(Formats.fileUri, (uri) {
        bloc.add(UploadFile(uri!));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const iconPath = 'assets/icons/drop.png';

    return DashedBorder(
      child: DropRegion(
        formats: Formats.standardFormats,
        onDropOver: (_) => DropOperation.copy,
        onPerformDrop: (event) => onPerformDrop(event, context),
        child: Center(
          child: Image.asset(iconPath),
        ),
      ),
    );
  }
}
