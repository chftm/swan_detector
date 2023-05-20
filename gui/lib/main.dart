import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:swan_classifier/swan_classifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DesktopWindow.setMinWindowSize(const Size(900, 650));

  runApp(const SwanClassifier());
}
