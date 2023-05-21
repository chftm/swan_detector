import 'package:flython/flython.dart';

class AIClient extends Flython {
  static const cmdPredict = 1;

  Future<Map<String, dynamic>> predict(String filePath) async {
    final command = {
      'cmd': cmdPredict,
      'file': filePath,
    };

    return await runCommand(command) as Map<String, dynamic>;
  }
}
