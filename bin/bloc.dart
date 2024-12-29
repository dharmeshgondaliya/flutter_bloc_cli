import 'dart:io';

import 'package:dcli/dcli.dart';
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
    CliDataProvider.instance.codePattern = CodePattern.bloc;
    Command command = CliCommand.instance.findCommand();
    if (command.requiredValidate()) {
      await command.validations?.validate();
      await PubspecUtils.instance.init();
    }
    await command.execute();
  } on CliException catch (e) {
    print(red("⚠  ${e.message}"));
  } on PathNotFoundException catch (e) {
    print(red("⚠  File does not exist: ${e.path}"));
  } catch (e) {
    print(red("⚠  ${e.toString()}"));
  }
  stopwatch.stop();
  print(yellow(
      "⌛ Total execution time: ${stopwatch.elapsedMilliseconds} Milliseconds\n"));
}
