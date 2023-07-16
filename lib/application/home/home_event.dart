part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class TriggerAppEvent extends HomeEvent {
  final int index;

  const TriggerAppEvent(this.index) : super();
}
