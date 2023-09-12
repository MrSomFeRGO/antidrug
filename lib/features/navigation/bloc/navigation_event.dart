part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class ChangePageEvent extends NavigationEvent {
  const ChangePageEvent(this.index);
  final int index;

  @override
  List<Object?> get props => [index];
}
