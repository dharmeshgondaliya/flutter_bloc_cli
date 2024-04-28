import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/generators/generator.dart';
import 'package:flutter_bloc_cli/generators/init_generator.dart';
import 'package:flutter_bloc_cli/utils/string_extensions.dart';
import 'package:process_run/shell_run.dart';

class InitCommand extends Command with Generator {
  InitCommand({required super.validations});

  @override
  Future<void> execute() async {
    await Future.wait([
      createDirectory(path: Constants.dataDirectoryPath),
      createDirectory(path: Constants.screensDirectoryPath),
      createDirectory(path: Constants.widgetsDirectoryPath),
      createDirectory(path: Constants.utilsDirectoryPath),
      createDirectory(path: Constants.constantsDirectoryPath),
      createDirectory(path: Constants.providerDirectoryPath),
    ]);
    await Future.wait([
      writeFile(
        path: Constants.mainFilePath,
        content: InitGenerator.mainFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.appFilePath,
        content: InitGenerator.appFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.appRoutesPath,
        content: InitGenerator.appRoutesFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.routeNavigatorPath,
        content: InitGenerator.routeNavigatorFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.colorConstantsPath,
        content: InitGenerator.colorConstantsFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.assetImagesPath,
        content: InitGenerator.assetImagesFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.baseScreenPath,
        content: InitGenerator.baseScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.baseDialogPath,
        content: InitGenerator.baseDialogFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.customAppbarPath,
        content: InitGenerator.customAppbarFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.splashScreenPath,
        content: InitGenerator.splashScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenPath,
        content: InitGenerator.homeScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenRepositoryPath,
        content: InitGenerator.homeScreenRepositoryFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenBlocPath,
        content: InitGenerator.homeScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenEventPath,
        content: InitGenerator.homeScreenEventFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenStatePath,
        content: InitGenerator.homeScreenStateFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.commonUtilsFilePath,
        content: InitGenerator.commonUtilsFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.textfieldWidgetPath,
        content: InitGenerator.textfieldWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.checkboxWidgetPath,
        content: InitGenerator.checkboxWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.radioButtonWidgetPath,
        content: InitGenerator.radioButtonWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.networkImageWidgetPath,
        content: InitGenerator.networkImageWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.textStyleFilePath,
        content: InitGenerator.textStyleFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.urlManagerPath,
        content: InitGenerator.urlManagerFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.preferenceProviderPath,
        content: InitGenerator.preferenceProviderFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.apiProviderPath,
        content: InitGenerator.apiProviderFileContent.replaceAppName,
      ),
    ]);
    await run(
      "flutter pub add bloc flutter_bloc cached_network_image shared_preferences http",
      verbose: false,
    );
  }

  @override
  bool requiredValidate() {
    return true;
  }
}
