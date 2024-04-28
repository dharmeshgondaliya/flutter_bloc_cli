import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/data/cli_data_provider.dart';

class CommandNotFound extends Command {
  @override
  Future<void> execute() async {
    print("Command ${CliDataProvider.instance.args.join(' ')} Not Found");
  }

  @override
  bool requiredValidate() {
    return false;
  }
}
