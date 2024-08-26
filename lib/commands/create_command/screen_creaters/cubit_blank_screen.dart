import 'dart:io';

import 'package:flutter_bloc_cli/commands/create_command/create_command.dart';
import 'package:flutter_bloc_cli/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/generators/create_generartor.dart';
import 'package:flutter_bloc_cli/generators/generator.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';

class CubitBlankScreen extends CreateCommand with Generator {
  @override
  Future<void> execute() async {
    bool routeExist = await checkDirectoryExist("${Directory.current.path}${Constants.routesDirectoryPath.actualPath()}");

    for (String screenName in CliDataProvider.instance.args.sublist(2)) {
      await createDirectory(path: "${Constants.screensDirectoryPath}\\$screenName".actualPath());

      await Future.wait([
        writeFile(
          path: "${Constants.screensDirectoryPath}\\$screenName\\cubit\\${screenName}_cubit.dart".actualPath(),
          content: getBlocFileContent(
            screenName,
            CreateGenerator.cubitFileContent,
          ),
        ),
        writeFile(
          path: "${Constants.screensDirectoryPath}\\$screenName\\cubit\\${screenName}_state.dart".actualPath(),
          content: getBlocStateFileContent(
            screenName,
            CreateGenerator.cubitStateFileContent,
          ),
        ),
        writeFile(
          path: "${Constants.screensDirectoryPath}\\$screenName\\view\\$screenName.dart".actualPath(),
          content: getScreenFileContent(
            screenName,
            CreateGenerator.cubitScreeFileContent,
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
      print("\nSuccess! The $screenName screen has been created successfully.");
    }
  }
}
