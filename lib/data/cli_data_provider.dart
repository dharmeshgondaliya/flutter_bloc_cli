import 'package:flutter_bloc_cli/commands/create_command.dart';
import 'package:flutter_bloc_cli/commands/help_command.dart';
import 'package:flutter_bloc_cli/commands/init_command.dart';
import 'package:flutter_bloc_cli/validations/create_validations.dart';
import 'package:flutter_bloc_cli/validations/init_validations.dart';

class CliDataProvider {
  static final CliDataProvider _blocCli = CliDataProvider._();
  static CliDataProvider get instance => _blocCli;
  CliDataProvider._();
  List<String> _args = [];

  final Map<String, dynamic> _commandData = {
    "help": {
      "args_length": 1,
      "has_sub_command": false,
      "command": HelpCommand(),
    },
    "init": {
      "args_length": 1,
      "has_sub_command": false,
      "command": InitCommand(
        validations: InitValidations(),
      ),
    },
    "create": {
      "args_length": 3,
      "has_sub_command": true,
      "sub_commands": ['screen'],
      "command": CreateCommand(
        validations: CreateValidations(),
      ),
    }
  };

  set args(List<String> args) {
    if (_args.isNotEmpty) throw "Arguments already initialize";
    _args = args;
  }

  List<String> get args => List.from(_args);

  Map<String, dynamic> get commandData => Map.from(_commandData);
}
