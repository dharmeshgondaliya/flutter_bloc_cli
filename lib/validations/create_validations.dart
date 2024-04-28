import 'dart:io';

import 'package:flutter_bloc_cli/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:flutter_bloc_cli/validations/validation_messages.dart';
import 'package:flutter_bloc_cli/validations/validations.dart';

class CreateValidations extends Validations {
  @override
  Future<void> validate() async {
    await super.validate();
    String path = Directory.current.path;
    bool directoryExist =
        await checkDirectoryExist("$path${Constants.screensDirectoryPath}");
    if (!directoryExist) {
      throw CliException(
        message: "${Constants.screensDirectoryPath} Directory not found",
      );
    }
    if (!isValidScreenName(CliDataProvider.instance.args[2])) {
      throw CliException(
        message: ValidationMessages.invalidScreenNameMessageString,
      );
    }
  }

  bool isValidScreenName(String name) {
    return RegExp(r'^[a-z][a-z0-9_]*[a-z0-9]$').hasMatch(name);
  }
}
