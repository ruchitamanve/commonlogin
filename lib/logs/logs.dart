import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LogsGenrate {
  late File file;
  static late Logger logger;
  initmethod() {
    getDirectoryForLogRecord().whenComplete(
      () {
        FileOutput fileOutPut = FileOutput(file: file);
        ConsoleOutput consoleOutput = ConsoleOutput();
        List<LogOutput> multiOutput = [fileOutPut, consoleOutput];
        logger = Logger(
            filter: DevelopmentFilter(),
            // Use the default LogFilter (-> only log in debug mode)
            printer: PrettyPrinter(
                methodCount: 2,
                // number of method calls to be displayed
                errorMethodCount: 8,
                // number of method calls if stacktrace is provided
                lineLength: 120,
                // width of the output
                colors: false,
                // Colorful log messages
                printEmojis: false,
                // Print an emoji for each log message
                printTime: true // Should each log print contain a timestamp
                ),
            // Use the PrettyPrinter to format and print log
            output: MultiOutput(
                multiOutput) // Use the default LogOutput (-> send everything to console)
            );
      },
    );
  }

  Future<void> getDirectoryForLogRecord() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    file = File('${directory.path}/withMultiOutput.txt');
  }

  late final String text;

  Future<String> _readfile() async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/withMultiOutput.txt');
      debugPrint("text===${file.path}");
      debugPrint(file.readAsStringSync());
      text = await file.readAsString();
    } catch (e) {
      debugPrint("Couldn't read file");
    }
    return text;
  }
}

class FileOutput extends LogOutput {
  late File file;
  final bool overrideExisting;
  final Encoding encoding;
  late IOSink _sink;

  // IOSink? _sink;

  FileOutput({
    required this.file,
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  @override
  void init() {
    _sink = file.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  void output(OutputEvent event) {
    _sink.writeAll(event.lines, '\n');
  }

  @override
  void destroy() async {
    await _sink.flush();
    await _sink.close();
  }
}
