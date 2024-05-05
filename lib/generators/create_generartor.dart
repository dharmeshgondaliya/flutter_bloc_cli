class CreateGenerator {
  static const String blocFileContent = """import 'package:bloc/bloc.dart';

part '<screen_name>_event.dart';

part '<screen_name>_state.dart';

class <bloc_name> extends Bloc<<event_name>, <state_name>> {
  <bloc_name>() : super(<state_name>()) {
    on<<event_name>>((event, emit) => null);
  }
}""";

  static const String blocEventFileContent =
      """part of '<screen_name>_bloc.dart';

sealed class <event_name> {}""";

  static const String blocStateFileContent =
      """part of '<screen_name>_bloc.dart';

class <state_name> {
  <state_name> copy() {
    return <state_name>();
  }
}""";

  static const String repositoryFileContent = """class <repository_name> {}""";

  static const String blocScreeFileContent =
      """import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/<screen_name>/bloc/<screen_name>_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class <screen_class_name> extends StatefulWidget {
  const <screen_class_name>({super.key});

  @override
  State<<screen_class_name>> createState() => _<screen_class_name>State();
}

class _<screen_class_name>State extends State<<screen_class_name>> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: BlocBuilder<<bloc_name>, <state_name>>(
        builder: (context, state) {
          return const Center(
            child: Text("<screen_content>"),
          );
        },
      ),
    );
  }
}""";

  static const String cubitFileContent = """import 'package:bloc/bloc.dart';

part '<screen_name>_state.dart';

class <cubit_name> extends Cubit<<state_name>> {
  <cubit_name>() : super(<state_name>());
}""";

  static const String cubitStateFileContent =
      """part of '<screen_name>_cubit.dart';

class <state_name> {
  <state_name> copy() {
    return <state_name>();
  }
}""";

  static const String cubitScreeFileContent =
      """import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/<screen_name>/cubit/<screen_name>_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class <screen_class_name> extends StatefulWidget {
  const <screen_class_name>({super.key});

  @override
  State<<screen_class_name>> createState() => _<screen_class_name>State();
}

class _<screen_class_name>State extends State<<screen_class_name>> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: BlocBuilder<<cubit_name>, <state_name>>(
        builder: (context, state) {
          return const Center(
            child: Text("<screen_content>"),
          );
        },
      ),
    );
  }
}""";
}
