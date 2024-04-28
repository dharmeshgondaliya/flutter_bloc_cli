import 'dart:io';
import 'package:flutter_bloc_cli/exception/cli_exception.dart';
import 'package:flutter_bloc_cli/utils/pubspec_utils.dart';
import 'package:flutter_bloc_cli/utils/string_extensions.dart';
import 'package:dart_style/dart_style.dart';

mixin Generator<T> {
  Future<void> createDirectory({required String path}) async {
    String directoryPath = "${Directory.current.path}$path";
    await Directory(directoryPath).create(recursive: true);
  }

  Future<String> readFile({required String path}) async {
    String filePath = "${Directory.current.path}$path";
    File file = File(filePath);
    if (!await file.exists()) {
      throw CliException(message: "File $path is not exist");
    }
    return await file.readAsString();
  }

  Future<void> writeFile({
    required String path,
    required String content,
  }) async {
    String filePath = "${Directory.current.path}$path";
    File file = File(filePath);
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    await file.writeAsString(content);
  }

  String getBlocFileContent(String screenName, String content) {
    return content
        .replaceAll("<screen_name>", screenName)
        .replaceAll("<bloc_name>", screenName.blocName)
        .replaceAll("<event_name>", screenName.eventName)
        .replaceAll("<state_name>", screenName.stateName)
        .replaceAppName;
  }

  String getBlocEventFileContent(String screenName, String content) {
    return content
        .replaceAll("<screen_name>", screenName)
        .replaceAll("<event_name>", screenName.eventName)
        .replaceAppName;
  }

  String getBlocStateFileContent(String screenName, String content) {
    return content
        .replaceAll("<screen_name>", screenName)
        .replaceAll("<state_name>", screenName.stateName)
        .replaceAppName;
  }

  String getRepositoryFileContent(String screenName, String content) {
    return content
        .replaceAll("<repository_name>", screenName.repositoryName)
        .replaceAppName;
  }

  String getScreenFileContent(String screenName, String content) {
    return content
        .replaceAll("<screen_name>", screenName)
        .replaceAll("<bloc_name>", screenName.blocName)
        .replaceAll("<state_name>", screenName.stateName)
        .replaceAll("<screen_class_name>", screenName.screenClassName)
        .replaceAll("<screen_content>", screenName.screenContent)
        .replaceAppName;
  }

  String getRoutesFileContent(String screenName, String routesFileContent) {
    String routeName = "";
    if (routesFileContent.contains("abstract class Routes")) {
      String routesData = routesFileContent
          .replaceAll("abstract class Routes {", "")
          .replaceAll("}", "")
          .trim();
      routeName = screenName.routeName;
      routesData =
          "$routesData\nstatic const String $routeName = \"/$routeName\";";

      String finalRoutes = "abstract class Routes {$routesData}";

      return DartFormatter().format(finalRoutes);
    }
    return routesFileContent;
  }

  String getNavigatorFileContent(
      String screenName, String navigatorFileContent) {
    String routeName = screenName.routeName;
    if (navigatorFileContent.contains("abstract class RouteNavigator")) {
      List lines = navigatorFileContent.replaceAll("\n\n", "\n").split("\n");
      int index = lines.indexWhere(
          (element) => element.contains("abstract class RouteNavigator"));
      if (index != -1) {
        String imports =
            "import 'package:${PubspecUtils.instance.getAppName}/App/screens/$screenName/view/$screenName.dart';\nimport 'package:${PubspecUtils.instance.getAppName}/App/screens/$screenName/bloc/${screenName}_bloc.dart';";
        lines.insert(index, "$imports\n\n");
      }
      navigatorFileContent = lines.join("\n");

      //
      RegExp regExp = RegExp(r'routes\s*=\s*{([^}]+)};');
      Match? match = regExp.firstMatch(navigatorFileContent);
      if (match == null) return navigatorFileContent;
      String? matchData = match.group(0);
      if (matchData == null) return navigatorFileContent;
      String mapStringData =
          matchData.replaceAll("routes = {", "").replaceAll("};", "").trim();
      if (!mapStringData.endsWith(",")) {
        mapStringData = "$mapStringData,";
      }

      String routes =
          "routes = {${mapStringData}Routes.$routeName: (BuildContext context) => BlocProvider(create: (context) => ${screenName.blocName}(),child: const ${screenName.camelCase}(),)};";
      navigatorFileContent = navigatorFileContent.replaceAll(matchData, routes);
      return DartFormatter().format(navigatorFileContent);
    }
    return navigatorFileContent;
  }
}
