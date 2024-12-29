part of 'home_screen_bloc.dart';

class HomeScreenState {
  HomeScreenState({this.currentState = ActivityState.initial});

  ActivityState currentState;

  HomeScreenState copy() {
    return HomeScreenState();
  }
}