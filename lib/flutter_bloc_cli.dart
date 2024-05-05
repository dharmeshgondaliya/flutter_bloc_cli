import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/commands/command_not_found.dart';
import 'package:flutter_bloc_cli/commands/invalid_command.dart';
import 'package:flutter_bloc_cli/data/cli_data_provider.dart';

class CliCommand {
  static final CliCommand _validation = CliCommand._();
  static CliCommand get instance => _validation;
  CliCommand._();

  Command findCommand() {
    final Map<String, dynamic> commandData = CliDataProvider
        .instance.commandData[CliDataProvider.instance.codePattern.value];
    List<String> args = CliDataProvider.instance.args;
    if (args.isEmpty) {
      return commandData["help"]["command"];
    }
    if (!commandData.containsKey(args.first)) {
      return CommandNotFound();
    }
    if (commandData[args.first]["args_length"] != args.length) {
      return InvalidCommand();
    }
    if (!commandData[args.first]["has_sub_command"]) {
      return commandData[args.first]["command"];
    }
    return _validate(commandData[args.first], args) ??
        commandData["help"]["command"];
  }

  Command? _validate(Map<String, dynamic> data, List<String> args) {
    if (data['args_length'] != args.length) {
      return InvalidCommand();
    }
    if ((data['sub_commands'] ?? []).contains(args[1])) {
      return data['command'];
    }
    return null;
  }
}
