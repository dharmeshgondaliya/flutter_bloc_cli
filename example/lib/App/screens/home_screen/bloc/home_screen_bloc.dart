import 'package:bloc/bloc.dart';

import 'package:example/App/core/enums/enums.dart';  

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState()) {
    on<HomeScreenEvent>((event, emit) => null);
  }
}