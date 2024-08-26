import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/App/routes/app_routes.dart';
import 'package:example/App/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:example/App/screens/home_screen/view/home_screen.dart';
import 'package:example/App/screens/splash_screen/view/splash_screen.dart';

abstract class RouteNavigator {
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.splash: (BuildContext context) => const SplashScreen(),
    Routes.homeScreen: (BuildContext context) => BlocProvider(
          create: (context) => HomeScreenBloc(),
          child: const HomeScreen(),
        ),
  };
}