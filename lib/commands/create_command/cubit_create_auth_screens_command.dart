import 'dart:io';

import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/generators/create_auth_screens_generator.dart';
import 'package:flutter_bloc_cli/generators/generator.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';
import 'package:flutter_bloc_cli/utils/string_extensions.dart';
import 'package:process_run/shell_run.dart';

class CubitAuthScreensCommand extends Command with Generator {
  CubitAuthScreensCommand({required super.validations});

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
        content: CreateAuthScreensGenerator.cubitLoginScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.loginScreen}\\cubit\\${Constants.loginScreen}_cubit.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitLoginScreenCubitFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.loginScreen}\\cubit\\${Constants.loginScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitLoginScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.loginScreen}\\repository\\${Constants.loginScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.loginScreenRepositoryFileContent,
      ),

      // Register screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.registerScreen}\\view\\${Constants.registerScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitRegisterScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.registerScreen}\\cubit\\${Constants.registerScreen}_cubit.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitRegisterScreenCubitFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.registerScreen}\\cubit\\${Constants.registerScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitRegisterScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.registerScreen}\\repository\\${Constants.registerScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.registerScreenRepositoryFileContent,
      ),

      // Forgot password screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.forgotPasswordScreen}\\view\\${Constants.forgotPasswordScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitForgotPasswordScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.forgotPasswordScreen}\\cubit\\${Constants.forgotPasswordScreen}_cubit.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitForgotPasswordScreenCubitFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.forgotPasswordScreen}\\cubit\\${Constants.forgotPasswordScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitForgotPasswordScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.forgotPasswordScreen}\\repository\\${Constants.forgotPasswordScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.forgotPasswordScreenRepositoryFileContent,
      ),

      // Reset password screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.resetPasswordScreen}\\view\\${Constants.resetPasswordScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitResetPasswordScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.resetPasswordScreen}\\cubit\\${Constants.resetPasswordScreen}_cubit.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitResetPasswordScreenCubitFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.resetPasswordScreen}\\cubit\\${Constants.resetPasswordScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitResetPasswordScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.resetPasswordScreen}\\repository\\${Constants.resetPasswordScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.resetPasswordScreenRepositoryFileContent,
      ),

      // Change password screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.changePasswordScreen}\\view\\${Constants.changePasswordScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitChangePasswordScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.changePasswordScreen}\\cubit\\${Constants.changePasswordScreen}_cubit.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitChangePasswordScreenCubitFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.changePasswordScreen}\\cubit\\${Constants.changePasswordScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitChangePasswordScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.changePasswordScreen}\\repository\\${Constants.changePasswordScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.changePasswordScreenRepositoryFileContent,
      ),

      // OTP verify screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.otpVerificationScreen}\\view\\${Constants.otpVerificationScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitOtpVerificationScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.otpVerificationScreen}\\cubit\\${Constants.otpVerificationScreen}_cubit.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitOtpVerificationScreenCubitFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.otpVerificationScreen}\\cubit\\${Constants.otpVerificationScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitOtpVerificationScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.otpVerificationScreen}\\repository\\${Constants.otpVerificationScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.otpVerificationScreenRepositoryFileContent,
      ),

      // Profile setup screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.profileSetupScreen}\\view\\${Constants.profileSetupScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitProfileSetupScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.profileSetupScreen}\\cubit\\${Constants.profileSetupScreen}_cubit.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitProfileSetupScreenCubitFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.profileSetupScreen}\\cubit\\${Constants.profileSetupScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitProfileSetupScreenStateFileContent,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.profileSetupScreen}\\repository\\${Constants.profileSetupScreen}_repository.dart".actualPath(),
        content: CreateAuthScreensGenerator.profileSetupScreenRepositoryFileContent,
      ),

      // Edit profile screen
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.editProfileScreen}\\view\\${Constants.editProfileScreen}.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitEditProfileScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.editProfileScreen}\\cubit\\${Constants.editProfileScreen}_cubit.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitEditProfileScreenCubitFileContent.replaceAppName,
      ),
      writeFile(
        path: "${Constants.screensDirectoryPath}\\${Constants.editProfileScreen}\\cubit\\${Constants.editProfileScreen}_state.dart".actualPath(),
        content: CreateAuthScreensGenerator.cubitEditProfileScreenStateFileContent,
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
        List routingData = await Future.wait([
          readFile(path: Constants.appRoutesPath.actualPath()),
          readFile(path: Constants.routeNavigatorPath.actualPath()),
        ]);
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
