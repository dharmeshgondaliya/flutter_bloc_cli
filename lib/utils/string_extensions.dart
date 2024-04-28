import 'package:flutter_bloc_cli/utils/pubspec_utils.dart';

extension StringExtension on String {
  String get camelCase {
    if (isEmpty || length == 1) {
      return this;
    }
    return split("_")
        .map((e) => e[0].toUpperCase() + e.substring(1).toLowerCase())
        .join();
  }

  String get replaceAppName =>
      replaceAll("<app_name>", PubspecUtils.instance.getAppName);

  String get blocName => "${camelCase}Bloc";
  String get eventName => "${camelCase}Event";
  String get stateName => "${camelCase}State";
  String get repositoryName => "${camelCase}Repository";
  String get screenClassName => camelCase;
  String get screenContent => split("_").join(" ");
  String get routeName {
    String name = camelCase;
    return name[0].toLowerCase() + name.substring(1);
  }
}
