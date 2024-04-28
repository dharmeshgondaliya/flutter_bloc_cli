import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/data/cli_data_provider.dart';

class InvalidCommand extends Command {
  @override
  Future<void> execute() async {
    print("Invalid command: ${CliDataProvider.instance.args.join(' ')}");
  }

  @override
  bool requiredValidate() {
    return true;
  }
}
