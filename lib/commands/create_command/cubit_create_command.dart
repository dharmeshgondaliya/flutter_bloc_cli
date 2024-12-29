import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:flutter_bloc_cli/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli/data/constants.dart';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';
import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/utils/common.dart';
import 'package:flutter_bloc_cli/utils/file_path_utils.dart';

import 'create_command.dart';
import 'screen_creaters/cubit_blank_screen.dart';
import 'screen_creaters/cubit_grid_screen.dart';
import 'screen_creaters/cubit_listing_screen.dart';

class CubitCreateCommand extends Command {
  CubitCreateCommand(
      {required super.validations, required this.createMultiple});
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
      bool screenExist = await checkDirectoryExist(
          "${Directory.current.path}${Constants.screensDirectoryPath}\\$screen"
              .actualPath());
      if (screenExist) {
        throw CliException(
            message:
                "${"${Constants.screensDirectoryPath}\\$screen".actualPath()} already exist");
      }
    }

    print('Choose the type of screen you want to create:');
    print(yellow('1) Blank Screen'));
    print('2) Listing Screen');
    print('3) Grid Screen');
    String option = ask(
      "\nWhich type of screen do you want to create: ",
      defaultValue: '1',
      validator: Ask.integer,
    );

    CreateCommand createScreen;
    switch (option) {
      case '1':
        createScreen = CubitBlankScreen();
      case '2':
        createScreen = CubitListingScreen();
      case '3':
        createScreen = CubitGridScreen();
      default:
        createScreen = CubitBlankScreen();
    }
    await createScreen.execute();
    print(green(createScreen.successMessage));
  }

  @override
  bool requiredValidate() {
    return true;
  }
}
