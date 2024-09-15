import 'dart:io';

import 'package:flutter_bloc_cli/exception/cli_exception.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';
import 'package:flutter_bloc_cli/validations/validations.dart';

import '../data/constants.dart';

class AuthScreensValidations extends Validations {
  @override
  Future<void> validate() async {
    await super.validate();
    String path = Directory.current.path;
    bool screensDirectoryExist = await checkDirectoryExist("$path${Constants.screensDirectoryPath.actualPath()}");
    if (!screensDirectoryExist) {
      throw CliException(message: "${Constants.screensDirectoryPath.actualPath()} Directory not found");
    }
    bool widgetsDirectoryExist = await checkDirectoryExist("$path${Constants.widgetsDirectoryPath.actualPath()}");
    if (!widgetsDirectoryExist) {
      throw CliException(message: "${Constants.widgetsDirectoryPath.actualPath()} Directory not found");
    }
    for (String screen in [
      Constants.loginScreen,
      Constants.registerScreen,
      Constants.forgotPasswordScreen,
      Constants.resetPasswordScreen,
      Constants.changePasswordScreen,
      Constants.otpVerificationScreen,
      Constants.profileSetupScreen,
      Constants.editProfileScreen,
    ]) {
      bool screenExist = await checkDirectoryExist("${Directory.current.path}${Constants.screensDirectoryPath}\\$screen".actualPath());
      if (screenExist) {
        throw CliException(message: "${"${Constants.screensDirectoryPath}\\$screen".actualPath()} already exist");
      }
    }
  }
}
