import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/generators/generator.dart';
import 'package:flutter_bloc_cli/generators/init_generator.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';
import 'package:flutter_bloc_cli/utils/string_extensions.dart';
import 'package:process_run/shell_run.dart' as process;

class BlocInitCommand extends Command with Generator {
  BlocInitCommand({required super.validations});

  @override
  Future<void> execute() async {
    await Future.wait([
      createDirectory(path: Constants.coreDirectoryPath.actualPath()),
      createDirectory(path: Constants.screensDirectoryPath.actualPath()),
      createDirectory(path: Constants.widgetsDirectoryPath.actualPath()),
      createDirectory(path: Constants.utilsDirectoryPath.actualPath()),
      createDirectory(path: Constants.constantsDirectoryPath.actualPath()),
      createDirectory(path: Constants.providerDirectoryPath.actualPath()),
      createDirectory(path: Constants.themeDirectoryPath.actualPath()),
      createDirectory(path: Constants.assetsImageDirectoryPath.actualPath()),
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
        path: Constants.mediaUtilsFilePath.actualPath(),
        content: InitGenerator.mediaUtilsFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.datePickerUtilsFilePath.actualPath(),
        content: InitGenerator.datePickerUtilsFileContent.replaceAppName,
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
        path: Constants.searchFieldWidgetPath.actualPath(),
        content: InitGenerator.searchFieldWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.emptyViewWidgetPath.actualPath(),
        content: InitGenerator.emptyWidgetFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.backArrowWidgetPath.actualPath(),
        content: InitGenerator.backArrowWidgetFileContent.replaceAppName,
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
        path: Constants.enumsPath.actualPath(),
        content: InitGenerator.enumsFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.apiProviderPath.actualPath(),
        content: InitGenerator.apiProviderFileContent.replaceAppName,
      ),
      writeFile(
        path: Constants.themeFilePath.actualPath(),
        content: InitGenerator.themeFileContent.replaceAppName,
      ),
    ]);

    String filePath = Platform.script.toFilePath();
    if (filePath.contains("flutter_bloc_cli")) {
      String directoryPath = filePath.substring(
          0,
          filePath.indexOf(
              "${Platform.pathSeparator}flutter_bloc_cli${Platform.pathSeparator}"));
      String emptyImageFilePath =
          "$directoryPath${Platform.pathSeparator}flutter_bloc_cli${Platform.pathSeparator}assets${Platform.pathSeparator}images${Platform.pathSeparator}empty.png";
      String destinationFilePath =
          "${Directory.current.path}${Constants.assetsEmptyImageFilePath.actualPath()}";

      File emptyImageFile = File(emptyImageFilePath);
      if (emptyImageFile.existsSync()) {
        File destinationFile = File(destinationFilePath);
        await destinationFile.create(recursive: true);
        await emptyImageFile.copy(destinationFile.path);
      }
    }

    print(green("""Generated files:\n
\\lib
  - App
    - core
      - constants
        - color_constants.dart
        - url_manager.dart

      - enums
        - enums.dart
      
      - provider
        - api_provider.dart
        - preference_provider.dart
      
      - theme
        - theme.dart
      
      - utils
        - app_text_style.dart
        - asset_images.dart
        - common.dart
        - date_picker_utils.dart
        - media_utils.dart
    
    - routes
      - app_routes.dart
      - route_navigator.dart
    
    - screens
      - base_screen
        - view
          - base_dialog.dart
          - base_screen.dart
          - custom_appbar.dart
      
      - home_screen
        - bloc
          - home_screen_bloc.dart
          - home_screen_event.dart
          - home_screen_state.dart
        
        - repository
          - home_screen_repository.dart
        
        - view
          - home_screen.dart    
      
      - splash_screen
        - view
          - splash_screen.dart    
    
    - widgets
     - app_checkbox.dart
     - app_network_image.dart
     - app_radio_button.dart
     - app_textfield.dart
     - back_arrow.dart
     - empty_view.dart
     - search_field.dart
  
  - app.dart
  - main.dart
\n\n"""));

    print(green("Adding the required dependencies to your project..."));

    await process.run(
        "flutter pub add bloc flutter_bloc cached_network_image shared_preferences http shimmer intl file_picker",
        verbose: false);

    print(green("√ Bloc Pattern structure successfully generated."));
  }

  @override
  bool requiredValidate() {
    return true;
  }
}
