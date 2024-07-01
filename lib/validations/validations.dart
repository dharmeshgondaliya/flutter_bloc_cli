import 'dart:io';

import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';

abstract class Validations<T> {
  Future<void> validate() async {
    String path = Directory.current.path;
    List<bool> files = await Future.wait([
      checkFileExist("$path${Constants.pubspecFilePath.actualPath()}"),
      checkFileExist("$path${Constants.mainFilePath.actualPath()}"),
    ]);
    if (!files[0]) {
      throw CliException(
        message: "${Constants.pubspecFilePath.actualPath()} file is not exist",
      );
    }
    if (!files[1]) {
      throw CliException(
        message: "${Constants.mainFilePath.actualPath()} file is not exist",
      );
    }
  }
}
