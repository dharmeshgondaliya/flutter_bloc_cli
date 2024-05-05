import 'package:flutter_bloc_cli/commands/command.dart';
import 'package:flutter_bloc_cli/generators/generator.dart';

class CubitHelpCommand extends Command with Generator {
  @override
  Future<void> execute() async {
    print("""List of available commands\n
    init: Initialize the structure of an existing project. Example: cubit init
    create screen: Generate screens (pages) for your application. Example: cubit create screen <screen_name>
    help: Display this help message\n\n""");
  }

  @override
  bool requiredValidate() {
    return false;
  }
}
