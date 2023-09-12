part of 'appbar_bloc.dart';

class AppbarState extends Equatable {
  const AppbarState({required this.titles});
  final List<String> titles;

  @override
  List<Object> get props => [titles];
}
