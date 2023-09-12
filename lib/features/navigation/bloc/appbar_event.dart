part of 'appbar_bloc.dart';

abstract class AppbarEvent extends Equatable {
  const AppbarEvent();
}

class AppbarAddTitle extends AppbarEvent {
  const AppbarAddTitle({required this.title});

  final String title;

  @override
  List<Object?> get props => [title];
}

class AppbarRemoveLastTitle extends AppbarEvent {
  @override
  List<Object?> get props => [];
}
