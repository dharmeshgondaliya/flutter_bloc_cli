import 'dart:io';

import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli/enums/enums.dart';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';
import 'package:flutter_bloc_cli/flutter_bloc_cli.dart';
import 'package:flutter_bloc_cli/utils/pubspec_utils.dart';

void main(List<String> arguments) async {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  try {
    CliDataProvider.instance.args = arguments;
    CliDataProvider.instance.codePattern = CodePattern.cubit;
    Command command = CliCommand.instance.findCommand();
    if (command.requiredValidate()) {
      await command.validations?.validate();
      await PubspecUtils.instance.init();
    }
    await command.execute();
  } on CliException catch (e) {
    print(e.message);
  } on PathNotFoundException catch (e) {
    print("File does not exist: ${e.path}");
  } catch (e) {
    print(e.toString());
  }
  stopwatch.stop();
  print(
      "Total execution time: ${stopwatch.elapsedMilliseconds} Milliseconds\n");
}
