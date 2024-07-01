import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/generators/generator.dart';
import 'package:flutter_bloc_cli/generators/init_generator.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';
import 'package:flutter_bloc_cli/utils/string_extensions.dart';
import 'package:process_run/shell_run.dart';

class BlocInitCommand extends Command with Generator {
  BlocInitCommand({required super.validations});

  @override
  Future<void> execute() async {
    await Future.wait([
      createDirectory(path: Constants.dataDirectoryPath.actualPath()),
      createDirectory(path: Constants.screensDirectoryPath.actualPath()),
      createDirectory(path: Constants.widgetsDirectoryPath.actualPath()),
      createDirectory(path: Constants.utilsDirectoryPath.actualPath()),
      createDirectory(path: Constants.constantsDirectoryPath.actualPath()),
      createDirectory(path: Constants.providerDirectoryPath.actualPath()),
    ]);
    await Future.wait([
      writeFile(
        path: Constants.mainFilePath.actualPath(),
        content: InitGenerator.mainFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.appFilePath.actualPath(),
        content: InitGenerator.appFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.appRoutesPath.actualPath(),
        content: InitGenerator.appRoutesFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.routeNavigatorPath.actualPath(),
        content: InitGenerator.routeNavigatorFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.colorConstantsPath.actualPath(),
        content: InitGenerator.colorConstantsFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.assetImagesPath.actualPath(),
        content: InitGenerator.assetImagesFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.baseScreenPath.actualPath(),
        content: InitGenerator.baseScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.baseDialogPath.actualPath(),
        content: InitGenerator.baseDialogFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.customAppbarPath.actualPath(),
        content: InitGenerator.customAppbarFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.splashScreenPath.actualPath(),
        content: InitGenerator.splashScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenPath.actualPath(),
        content: InitGenerator.homeScreenFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenRepositoryPath.actualPath(),
        content: InitGenerator.homeScreenRepositoryFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenBlocPath.actualPath(),
        content: InitGenerator.homeScreenBlocFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenEventPath.actualPath(),
        content: InitGenerator.homeScreenEventFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.homeScreenStatePathBloc.actualPath(),
        content: InitGenerator.homeScreenStateFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.commonUtilsFilePath.actualPath(),
        content: InitGenerator.commonUtilsFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.textFieldWidgetPath.actualPath(),
        content: InitGenerator.textfieldWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.checkboxWidgetPath.actualPath(),
        content: InitGenerator.checkboxWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.radioButtonWidgetPath.actualPath(),
        content: InitGenerator.radioButtonWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.networkImageWidgetPath.actualPath(),
        content: InitGenerator.networkImageWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.textStyleFilePath.actualPath(),
        content: InitGenerator.textStyleFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.urlManagerPath.actualPath(),
        content: InitGenerator.urlManagerFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.preferenceProviderPath.actualPath(),
        content: InitGenerator.preferenceProviderFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.apiProviderPath.actualPath(),
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
