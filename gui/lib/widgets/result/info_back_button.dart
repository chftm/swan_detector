import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swan_classifier/bloc/classifier_bloc.dart';
import 'package:swan_classifier/bloc/classifier_event.dart';
import 'package:swan_classifier/widgets/generic/button.dart';

class InfoBackButton extends StatelessWidget {
  const InfoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Button(
        onPressed: () => context.read<ClassifierBloc>().add(Back()),
        text: 'Назад',
      ),
    );
  }
}
