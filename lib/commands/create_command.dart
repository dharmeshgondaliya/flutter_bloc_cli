import 'dart:io';

import 'package:flutter_bloc_cli/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';
import 'package:flutter_bloc_cli/generators/create_generartor.dart';
import 'package:flutter_bloc_cli/generators/generator.dart';
import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:dcli/dcli.dart';

class CreateCommand extends Command with Generator {
  CreateCommand({required super.validations});
  @override
  Future<void> execute() async {
    List<String> args = CliDataProvider.instance.args;
    if (args[1] == "screen") {
      await createPage();
    }
  }

  Future<void> createPage() async {
    String screenName = CliDataProvider.instance.args[2];
    bool screenExist = await checkDirectoryExist(
      "${Directory.current.path}${Constants.screensDirectoryPath}\\$screenName",
    );
    if (screenExist) {
      throw CliException(
        message:
            "${Constants.screensDirectoryPath}\\$screenName} already exist",
      );
    }
    // bool addRepository = await addRepositoryOption();
    await createDirectory(
      path: "${Constants.screensDirectoryPath}\\$screenName",
    );

    await Future.wait([
      writeFile(
        path:
            "${Constants.screensDirectoryPath}\\$screenName\\bloc\\${screenName}_bloc.dart",
        content: getBlocFileContent(
          screenName,
          CreateGenerator.blocFileContent,
        ),
      ),
      writeFile(
        path:
            "${Constants.screensDirectoryPath}\\$screenName\\bloc\\${screenName}_event.dart",
        content: getBlocEventFileContent(
          screenName,
          CreateGenerator.blocEventFileContent,
        ),
      ),
      writeFile(
        path:
            "${Constants.screensDirectoryPath}\\$screenName\\bloc\\${screenName}_state.dart",
        content: getBlocStateFileContent(
          screenName,
          CreateGenerator.blocStateFileContent,
        ),
      ),
      writeFile(
        path:
            "${Constants.screensDirectoryPath}\\$screenName\\view\\$screenName.dart",
        content: getScreenFileContent(
          screenName,
          CreateGenerator.screeFileContent,
        ),
      ),
      // if (addRepository) ...[
      writeFile(
        path:
            "${Constants.screensDirectoryPath}\\$screenName\\repository\\${screenName}_repository.dart",
        content: getRepositoryFileContent(
          screenName,
          CreateGenerator.repositoryFileContent,
        ),
      ),
      // ]
    ]);
    List routingData = await Future.wait([
      readFile(path: Constants.appRoutesPath),
      readFile(path: Constants.routeNavigatorPath)
    ]);
    String routesFileData = routingData[0];
    String routeNavigatorData = routingData[1];

    await Future.wait([
      writeFile(
        path: Constants.appRoutesPath,
        content: getRoutesFileContent(
          screenName,
          routesFileData,
        ),
      ),
      writeFile(
        path: Constants.routeNavigatorPath,
        content: getNavigatorFileContent(
          screenName,
          routeNavigatorData,
        ),
      ),
    ]);
    print("\nSuccess! The $screenName screen has been created successfully.");
  }

  Future<bool> addRepositoryOption() async {
    final option = menu(
      "Add repository?",
      options: ["yes", "no"],
      defaultOption: "yes",
    );
    return option == "yes";
  }

  @override
  bool requiredValidate() {
    return true;
  }
}
