import 'dart:io';

import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

class PubspecUtils {
  static final PubspecUtils _pubspecUtils = PubspecUtils._();
  static PubspecUtils get instance => _pubspecUtils;
  PubspecUtils._();
  late Pubspec pubSpec;

  Future<void> init() async {
    String path =
        "${Directory.current.path}${Constants.pubspecFilePath}".actualPath();
    File pubspecFile = File(path);
    String pubspecFileString = await pubspecFile.readAsString();
    pubSpec = Pubspec.parse(pubspecFileString);
  }

  String get getAppName => pubSpec.name;
}
