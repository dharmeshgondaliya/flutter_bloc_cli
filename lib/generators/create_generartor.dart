class CreateGenerator {
  static const String blocFileContent = """import 'package:bloc/bloc.dart';

import 'package:<app_name>/App/data/enums/enums.dart';

part '<screen_name>_event.dart';

part '<screen_name>_state.dart';

class <bloc_name> extends Bloc<<event_name>, <state_name>> {
  <bloc_name>() : super(<state_name>()) {
    on<<event_name>>((event, emit) => null);
  }
}""";

  static const String blocEventFileContent = """part of '<screen_name>_bloc.dart';

sealed class <event_name> {}""";

  static const String blocStateFileContent = """part of '<screen_name>_bloc.dart';

class <state_name> {
  <state_name>({this.currentState = ActivityState.initial});

  ActivityState currentState;

  <state_name> copy() {
    return <state_name>(currentState: currentState);
  }
}""";

  static const String blocListFileContent = """import 'package:bloc/bloc.dart';

import 'package:<app_name>/App/data/enums/enums.dart';

part '<screen_name>_event.dart';

part '<screen_name>_state.dart';

class <bloc_name> extends Bloc<<event_name>, <state_name>> {
  <bloc_name>() : super(<state_name>()) {
    on<FetchInitialData>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      state.currentState = ActivityState.loaded;
      emit(state.copy());
    });
    on<SearchData>((event, emit) async {
      state.currentState = ActivityState.loading;
      emit(state.copy());
      await Future.delayed(const Duration(seconds: 1));
      state.currentState = ActivityState.loaded;
      emit(state.copy());
    });
  }
}""";

  static const String blocEventListFileContent = """part of '<screen_name>_bloc.dart';

sealed class <event_name> {}

class FetchInitialData extends <event_name> {}

class SearchData extends <event_name> {
  SearchData({required this.query});
  final String query;
}""";

  static const String blocStateListFileContent = """part of '<screen_name>_bloc.dart';

class <state_name> {
  <state_name>({this.currentState = ActivityState.loading});

  ActivityState currentState;

  <state_name> copy() {
    return <state_name>(currentState: currentState);
  }
}""";

  static const String blocGridFileContent = """import 'package:bloc/bloc.dart';

import 'package:<app_name>/App/data/enums/enums.dart';

part '<screen_name>_event.dart';

part '<screen_name>_state.dart';

class <bloc_name> extends Bloc<<event_name>, <state_name>> {
  <bloc_name>() : super(<state_name>()) {
    on<FetchInitialData>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      state.currentState = ActivityState.loaded;
      emit(state.copy());
    });
    on<SearchData>((event, emit) async {
      state.currentState = ActivityState.loading;
      emit(state.copy());
      await Future.delayed(const Duration(seconds: 1));
      state.currentState = ActivityState.loaded;
      emit(state.copy());
    });
  }
}""";

  static const String blocEventGridFileContent = """part of '<screen_name>_bloc.dart';

sealed class <event_name> {}

class FetchInitialData extends <event_name> {}

class SearchData extends <event_name> {
  SearchData({required this.query});
  final String query;
}""";

  static const String blocStateGridFileContent = """part of '<screen_name>_bloc.dart';

class <state_name> {
  <state_name>({this.currentState = ActivityState.loading});

  ActivityState currentState;

  <state_name> copy() {
    return <state_name>(currentState: currentState);
  }
}""";

  static const String repositoryFileContent = """class <repository_name> {}""";

  static const String blocScreeFileContent = """import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/<screen_name>/bloc/<screen_name>_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class <screen_class_name> extends StatefulWidget {
  const <screen_class_name>({super.key});

  @override
  State<<screen_class_name>> createState() => _<screen_class_name>State();
}

class _<screen_class_name>State extends State<<screen_class_name>> {
  
  <bloc_instance>

  @override
  void dispose() {
    <close_bloc>
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: BlocBuilder<<bloc_name>, <state_name>>(
        <bloc__instance>
        builder: (context, state) {
          return const Center(
            child: Text("<screen_content>"),
          );
        },
      ),
    );
  }
}""";

  static const String blocGridScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/widgets/search_field.dart';
import 'package:bloc_cli_test/App/widgets/empty_view.dart';
import 'package:<app_name>/App/data/enums/enums.dart';
import '../bloc/<screen_name>_bloc.dart';
import 'grid_list_item_view.dart';
import 'loading_view.dart';

class <screen_class_name> extends StatefulWidget {
  const <screen_class_name>({super.key});

  @override
  State<<screen_class_name>> createState() => _<screen_class_name>State();
}

class _<screen_class_name>State extends State<<screen_class_name>> {
  final TextEditingController searchController = TextEditingController();
  
  <bloc_instance>

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      <bloc_provider_instance>.add(FetchInitialData());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SearchField(
              searchController: searchController,
              onTextChange: (text) {
                <bloc_provider_instance>.add(SearchData(query: text));
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<<bloc_name>, <state_name>>(
                <bloc__instance>
                builder: (context, state) {
                  if (state.currentState == ActivityState.loading) {
                    return const LoadingView();
                  }
                  if (state.currentState == ActivityState.empty) {
                    return const EmptyView();
                  }
                  return GridView.builder(
                    itemCount: 20,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) => GridListItem(onTap: () {}),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}""";

  static const String blocListingScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/widgets/search_field.dart';
import 'package:<app_name>/App/widgets/empty_view.dart';
import 'package:<app_name>/App/data/enums/enums.dart';
import '../bloc/<screen_name>_bloc.dart';
import 'list_item_view.dart';
import 'loading_view.dart';

class <screen_class_name> extends StatefulWidget {
  const <screen_class_name>({super.key});

  @override
  State<<screen_class_name>> createState() => _<screen_class_name>State();
}

class _<screen_class_name>State extends State<<screen_class_name>> {
  final TextEditingController searchController = TextEditingController();
  
  <bloc_instance>

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    <close_bloc>
    super.dispose();
  }

  void init() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      <bloc_provider_instance>.add(FetchInitialData());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SearchField(
              searchController: searchController,
              onTextChange: (text) {
                <bloc_provider_instance>.add(SearchData(query: text));
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<<bloc_name>, <state_name>>(
                <bloc__instance>
                builder: (context, state) {
                  if (state.currentState == ActivityState.loading) {
                    return const LoadingView();
                  }
                  if (state.currentState == ActivityState.empty) {
                    return const EmptyView();
                  }
                  return ListView.separated(
                    itemCount: 25,
                    itemBuilder: (context, index) => ListItemView(onTap: () {}),
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}""";

  static const String cubitFileContent = """import 'package:bloc/bloc.dart';

import 'package:<app_name>/App/data/enums/enums.dart';

part '<screen_name>_state.dart';

class <cubit_name> extends Cubit<<state_name>> {
  <cubit_name>() : super(<state_name>());
}""";

  static const String cubitStateFileContent = """part of '<screen_name>_cubit.dart';

class <state_name> {
  <state_name>({this.currentState = ActivityState.initial});

  ActivityState currentState;

  <state_name> copy() {
    return <state_name>(currentState: currentState);
  }
}""";

  static const String cubitListFileContent = """import 'package:bloc/bloc.dart';

import 'package:<app_name>/App/data/enums/enums.dart';

part '<screen_name>_state.dart';

class <cubit_name> extends Cubit<<state_name>> {
  <cubit_name>() : super(<state_name>());

  Future<void> fetchInitialData() async {
    await Future.delayed(const Duration(seconds: 2));
    state.currentState = ActivityState.loaded;
    emit(state.copy());
  }

  Future<void> searchData({required String query}) async {
    state.currentState = ActivityState.loading;
    emit(state.copy());
    await Future.delayed(const Duration(seconds: 1));
    state.currentState = ActivityState.loaded;
    emit(state.copy());
  }

}""";

  static const String cubitStateListFileContent = """part of '<screen_name>_cubit.dart';

class <state_name> {
  <state_name>({this.currentState = ActivityState.loading});

  ActivityState currentState;

  <state_name> copy() {
    return <state_name>(currentState: currentState);
  }
}""";

  static const String cubitGridFileContent = """import 'package:bloc/bloc.dart';

import 'package:<app_name>/App/data/enums/enums.dart';

part '<screen_name>_state.dart';

class <cubit_name> extends Cubit<<state_name>> {
  <cubit_name>() : super(<state_name>());

  Future<void> fetchInitialData() async {
    await Future.delayed(const Duration(seconds: 2));
    state.currentState = ActivityState.loaded;
    emit(state.copy());
  }

  Future<void> searchData({required String query}) async {
    state.currentState = ActivityState.loading;
    emit(state.copy());
    await Future.delayed(const Duration(seconds: 1));
    state.currentState = ActivityState.loaded;
    emit(state.copy());
  }

}""";

  static const String cubitStateGridFileContent = """part of '<screen_name>_cubit.dart';

class <state_name> {
  <state_name>({this.currentState = ActivityState.loading});

  ActivityState currentState;

  <state_name> copy() {
    return <state_name>(currentState: currentState);
  }
}""";

  static const String cubitScreeFileContent = """import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/<screen_name>/cubit/<screen_name>_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class <screen_class_name> extends StatefulWidget {
  const <screen_class_name>({super.key});

  @override
  State<<screen_class_name>> createState() => _<screen_class_name>State();
}

class _<screen_class_name>State extends State<<screen_class_name>> {
  
  <cubit_instance>

  @override
  void dispose() {
    <close_cubit>
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: BlocBuilder<<cubit_name>, <state_name>>(
        <cubit__instance>
        builder: (context, state) {
          return const Center(
            child: Text("<screen_content>"),
          );
        },
      ),
    );
  }
}""";

  static const String cubitGridScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/<screen_name>/cubit/<screen_name>_cubit.dart';
import 'package:<app_name>/App/data/enums/enums.dart';
import 'package:<app_name>/App/widgets/search_field.dart';
import 'package:bloc_cli_test/App/widgets/empty_view.dart';
import 'grid_list_item_view.dart';
import 'loading_view.dart';

class <screen_class_name> extends StatefulWidget {
  const <screen_class_name>({super.key});

  @override
  State<<screen_class_name>> createState() => _<screen_class_name>State();
}

class _<screen_class_name>State extends State<<screen_class_name>> {
  final TextEditingController searchController = TextEditingController();
  
  <cubit_instance>

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    <close_cubit>
    super.dispose();
  }

  void init() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      <cubit_provider_instance>.fetchInitialData();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SearchField(
              searchController: searchController,
              onTextChange: (text) {
                <cubit_provider_instance>.searchData(query: text);
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<<cubit_name>, <state_name>>(
                <cubit__instance>
                builder: (context, state) {
                  if (state.currentState == ActivityState.loading) {
                    return const LoadingView();
                  }
                  if (state.currentState == ActivityState.empty) {
                    return const EmptyView();
                  }
                  return GridView.builder(
                    itemCount: 20,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) => GridListItem(onTap: () {}),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}""";

  static const String cubitListingScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/<screen_name>/cubit/<screen_name>_cubit.dart';
import 'package:<app_name>/App/data/enums/enums.dart';
import 'package:<app_name>/App/widgets/search_field.dart';
import 'package:bloc_cli_test/App/widgets/empty_view.dart';
import 'list_item_view.dart';
import 'loading_view.dart';

class <screen_class_name> extends StatefulWidget {
  const <screen_class_name>({super.key});

  @override
  State<<screen_class_name>> createState() => _<screen_class_name>State();
}

class _<screen_class_name>State extends State<<screen_class_name>> {
  final TextEditingController searchController = TextEditingController();
  
  <cubit_instance>

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    <close_cubit>
    super.dispose();
  }

  void init() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      <cubit_provider_instance>.fetchInitialData();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SearchField(
              searchController: searchController,
              onTextChange: (text) {
                <cubit_provider_instance>.searchData(query: text);
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<<cubit_name>, <state_name>>(
                <cubit__instance>
                builder: (context, state) {
                  if (state.currentState == ActivityState.loading) {
                    return const LoadingView();
                  }
                  if (state.currentState == ActivityState.empty) {
                    return const EmptyView();
                  }
                  return ListView.separated(
                    itemCount: 25,
                    itemBuilder: (context, index) => ListItemView(onTap: () {}),
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}""";

  static const String listItemViewFileContent = """import 'package:flutter/material.dart';

class ListItemView extends StatelessWidget {
  const ListItemView({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: const Placeholder(),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem ipsum",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Lorem ipsum is placeholder text",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}""";

  static const String listLoadingViewFileContent = """import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                        width: 160,
                        child: ColoredBox(color: Colors.grey.shade300),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 15,
                        width: double.infinity,
                        child: ColoredBox(color: Colors.grey.shade300),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}""";

  static const String gridLoadingViewFileContent = """import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Card(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 15,
                    width: 100,
                    child: ColoredBox(color: Colors.grey.shade300),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 15,
                    width: double.infinity,
                    child: ColoredBox(color: Colors.grey.shade300),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 15,
                    width: double.infinity,
                    child: ColoredBox(color: Colors.grey.shade300),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}""";

  static const String gridItemViewFileContent = """import 'package:flutter/material.dart';

class GridListItem extends StatelessWidget {
  const GridListItem({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: const Placeholder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Lorem ipsum",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            const Text(
              "Lorem ipsum is placeholder text",
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}""";
}
