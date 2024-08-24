import 'dart:io';

import 'package:flutter_bloc_cli/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';
import 'package:flutter_bloc_cli/generators/create_generartor.dart';
import 'package:flutter_bloc_cli/generators/generator.dart';
import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';

class BlocCreateCommand extends Command with Generator {
  BlocCreateCommand({required super.validations, required this.createMultiple});
  final bool createMultiple;

  @override
  Future<void> execute() async {
    List<String> args = CliDataProvider.instance.args;
    if (args[1] == "screen" || args[1] == "screens") {
      await createPage();
    }
  }

  Future<void> createPage() async {
    for (String screen in CliDataProvider.instance.args.sublist(2)) {
      bool screenExist = await checkDirectoryExist("${Directory.current.path}${Constants.screensDirectoryPath}\\$screen".actualPath());
      if (screenExist) {
        throw CliException(message: "${"${Constants.screensDirectoryPath}\\$screen".actualPath()} already exist");
      }
    }

    bool routeExist = await checkDirectoryExist("${Directory.current.path}${Constants.routesDirectoryPath.actualPath()}");

    for (String screenName in CliDataProvider.instance.args.sublist(2)) {
      await createDirectory(path: "${Constants.screensDirectoryPath}\\$screenName".actualPath());

      await Future.wait([
        writeFile(
          path: "${Constants.screensDirectoryPath}\\$screenName\\bloc\\${screenName}_bloc.dart".actualPath(),
          content: getBlocFileContent(
            screenName,
            CreateGenerator.blocFileContent,
          ),
        ),
        writeFile(
          path: "${Constants.screensDirectoryPath}\\$screenName\\bloc\\${screenName}_event.dart".actualPath(),
          content: getBlocEventFileContent(
            screenName,
            CreateGenerator.blocEventFileContent,
          ),
        ),
        writeFile(
          path: "${Constants.screensDirectoryPath}\\$screenName\\bloc\\${screenName}_state.dart".actualPath(),
          content: getBlocStateFileContent(
            screenName,
            CreateGenerator.blocStateFileContent,
          ),
        ),
        writeFile(
          path: "${Constants.screensDirectoryPath}\\$screenName\\view\\$screenName.dart".actualPath(),
          content: getScreenFileContent(
            screenName,
            CreateGenerator.blocScreeFileContent,
            routeExist,
          ),
        ),
        writeFile(
          path: "${Constants.screensDirectoryPath}\\$screenName\\repository\\${screenName}_repository.dart".actualPath(),
          content: getRepositoryFileContent(
            screenName,
            CreateGenerator.repositoryFileContent,
          ),
        ),
      ]);

      if (routeExist) {
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
      print("\nSuccess! The $screenName screen has been created successfully.");
    }
  }

  @override
  bool requiredValidate() {
    return true;
  }
}
