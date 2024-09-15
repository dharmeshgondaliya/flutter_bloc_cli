import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';

class InvalidCommand extends Command {
  @override
  Future<void> execute() async {
    throw CliException(message: "Invalid command: ${CliDataProvider.instance.args.join(' ')}");
  }

  @override
  bool requiredValidate() {
    return true;
  }
}
