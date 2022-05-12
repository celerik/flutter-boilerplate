import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      debugPrint(line, wrapWidth: 1024);
    }
  }
}
