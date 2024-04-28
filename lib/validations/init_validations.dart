import 'dart:io';

import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:flutter_bloc_cli/validations/validations.dart';

class InitValidations extends Validations {
  @override
  Future<void> validate() async {
    await super.validate();
    String path = Directory.current.path;
    bool appDirectoryExist =
        await checkDirectoryExist("$path${Constants.appDirectoryPath}");
    if (appDirectoryExist) {
      throw CliException(
        message: "Initialization already completed",
      );
    }
  }
}
