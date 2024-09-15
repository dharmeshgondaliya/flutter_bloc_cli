import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';

class CommandNotFound extends Command {
  @override
  Future<void> execute() async {
    throw CliException(message: "Command ${CliDataProvider.instance.args.join(' ')} Not Found");
  }

  @override
  bool requiredValidate() {
    return false;
  }
}
