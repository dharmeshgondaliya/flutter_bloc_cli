import 'dart:io';

import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/generators/create_auth_screens_generator.dart';
import 'package:flutter_bloc_cli/generators/generator.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';
import 'package:flutter_bloc_cli/utils/string_extensions.dart';
import 'package:process_run/shell_run.dart';

import '../command.dart';

class BlocAuthScreensCommand extends Command with Generator {
  BlocAuthScreensCommand({required super.validations});

  @override
  Future<void> execute() async {
    bool routeExist = await checkDirectoryExist("${Directory.current.path}${Constants.routesDirectoryPath.actualPath()}");

    Future.wait([
      writeFile(
        path: Constants.authTextFieldWidgetPath.actualPath(),
        content: CreateAuthScreensGenerator.authTextFieldFileContent,
      ),
      writeFile(
        path: Constants.authSubmitButtonWidgetPath.actualPath(),
        content: CreateAuthScreensGenerator.authSubmitButtonFileContent,
      ),

      // Login screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.loginScreen}\\view\\${Constants.loginScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.loginScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.loginScreen}\\bloc\\${Constants.loginScreen}_bloc.dart".actualPath(),
        content: CreateAuthScreensGenerator.loginScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.loginScreen}\\bloc\\${Constants.loginScreen}_event.dart".actualPath(),
        content: CreateAuthScreensGenerator.loginScreenEventFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.loginScreen}\\bloc\\${Constants.loginScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.loginScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.loginScreen}\\repository\\${Constants.loginScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.loginScreenRepositoryFileContent,
      ),

      // Register screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.registerScreen}\\view\\${Constants.registerScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.registerScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.registerScreen}\\bloc\\${Constants.registerScreen}_bloc.dart".actualPath(),
        content: CreateAuthScreensGenerator.registerScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.registerScreen}\\bloc\\${Constants.registerScreen}_event.dart".actualPath(),
        content: CreateAuthScreensGenerator.registerScreenEventFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.registerScreen}\\bloc\\${Constants.registerScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.registerScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.registerScreen}\\repository\\${Constants.registerScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.registerScreenRepositoryFileContent,
      ),

      // Forgot password screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.forgotPasswordScreen}\\view\\${Constants.forgotPasswordScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.forgotPasswordScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.forgotPasswordScreen}\\bloc\\${Constants.forgotPasswordScreen}_bloc.dart".actualPath(),
        content: CreateAuthScreensGenerator.forgotPasswordScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.forgotPasswordScreen}\\bloc\\${Constants.forgotPasswordScreen}_event.dart".actualPath(),
        content: CreateAuthScreensGenerator.forgotPasswordScreenEventFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.forgotPasswordScreen}\\bloc\\${Constants.forgotPasswordScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.forgotPasswordScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.forgotPasswordScreen}\\repository\\${Constants.forgotPasswordScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.forgotPasswordScreenRepositoryFileContent,
      ),

      // Reset password screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.resetPasswordScreen}\\view\\${Constants.resetPasswordScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.resetPasswordScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.resetPasswordScreen}\\bloc\\${Constants.resetPasswordScreen}_bloc.dart".actualPath(),
        content: CreateAuthScreensGenerator.resetPasswordScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.resetPasswordScreen}\\bloc\\${Constants.resetPasswordScreen}_event.dart".actualPath(),
        content: CreateAuthScreensGenerator.resetPasswordScreenEventFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.resetPasswordScreen}\\bloc\\${Constants.resetPasswordScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.resetPasswordScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.resetPasswordScreen}\\repository\\${Constants.resetPasswordScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.resetPasswordScreenRepositoryFileContent,
      ),

      // Change password screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.changePasswordScreen}\\view\\${Constants.changePasswordScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.changePasswordScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.changePasswordScreen}\\bloc\\${Constants.changePasswordScreen}_bloc.dart".actualPath(),
        content: CreateAuthScreensGenerator.changePasswordScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.changePasswordScreen}\\bloc\\${Constants.changePasswordScreen}_event.dart".actualPath(),
        content: CreateAuthScreensGenerator.changePasswordScreenEventFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.changePasswordScreen}\\bloc\\${Constants.changePasswordScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.changePasswordScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.changePasswordScreen}\\repository\\${Constants.changePasswordScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.changePasswordScreenRepositoryFileContent,
      ),

      // OTP verify screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.otpVerificationScreen}\\view\\${Constants.otpVerificationScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.otpVerificationScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.otpVerificationScreen}\\bloc\\${Constants.otpVerificationScreen}_bloc.dart".actualPath(),
        content: CreateAuthScreensGenerator.otpVerificationScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.otpVerificationScreen}\\bloc\\${Constants.otpVerificationScreen}_event.dart".actualPath(),
        content: CreateAuthScreensGenerator.otpVerificationScreenEventFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.otpVerificationScreen}\\bloc\\${Constants.otpVerificationScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.otpVerificationScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.otpVerificationScreen}\\repository\\${Constants.otpVerificationScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.otpVerificationScreenRepositoryFileContent,
      ),

      // Profile setup screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.profileSetupScreen}\\view\\${Constants.profileSetupScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.profileSetupScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.profileSetupScreen}\\bloc\\${Constants.profileSetupScreen}_bloc.dart".actualPath(),
        content: CreateAuthScreensGenerator.profileSetupScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.profileSetupScreen}\\bloc\\${Constants.profileSetupScreen}_event.dart".actualPath(),
        content: CreateAuthScreensGenerator.profileSetupScreenEventFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.profileSetupScreen}\\bloc\\${Constants.profileSetupScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.profileSetupScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.profileSetupScreen}\\repository\\${Constants.profileSetupScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.profileSetupScreenRepositoryFileContent,
      ),

      // Edit profile screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.editProfileScreen}\\view\\${Constants.editProfileScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.editProfileScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.editProfileScreen}\\bloc\\${Constants.editProfileScreen}_bloc.dart".actualPath(),
        content: CreateAuthScreensGenerator.editProfileScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.editProfileScreen}\\bloc\\${Constants.editProfileScreen}_event.dart".actualPath(),
        content: CreateAuthScreensGenerator.editProfileScreenEventFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.editProfileScreen}\\bloc\\${Constants.editProfileScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.editProfileScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.editProfileScreen}\\repository\\${Constants.editProfileScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.editProfileScreenRepositoryFileContent,
      ),
    ]);

    if (routeExist) {
      for (String screenName in [
        Constants.loginScreen,
        Constants.registerScreen,
        Constants.forgotPasswordScreen,
        Constants.resetPasswordScreen,
        Constants.changePasswordScreen,
        Constants.otpVerificationScreen,
        Constants.profileSetupScreen,
        Constants.editProfileScreen,
      ]) {
        List routingData = await Future.wait([readFile(path: Constants.appRoutesPath.actualPath()), readFile(path: Constants.routeNavigatorPath.actualPath())]);
        String routesFileData = routingData[0];
        String routeNavigatorData = routingData[1];

        await Future.wait([
          writeFile(
            path: Constants.appRoutesPath.actualPath(),
            content: getRoutesFileContent(
              screenName,
              routesFileData,
            ),
          ),
          writeFile(
            path: Constants.routeNavigatorPath.actualPath(),
            content: getNavigatorFileContent(
              screenName,
              routeNavigatorData,
            ),
          ),
        ]);
      }
    }

    await run(
      "flutter pub add flutter_otp_text_field",
      verbose: false,
    );

    print("\nSuccess! The Authentication screens has been created successfully.");
  }

  @override
  bool requiredValidate() => true;
}
