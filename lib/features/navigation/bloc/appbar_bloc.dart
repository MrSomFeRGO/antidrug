import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'appbar_event.dart';
part 'appbar_state.dart';

class AppbarBloc extends Bloc<AppbarEvent, AppbarState> {
  AppbarBloc() : super(const AppbarState(titles: [''])) {
    on<AppbarAddTitle>((event, emit) => _appbarAddTitle(event, emit));
    on<AppbarRemoveLastTitle>(
        (event, emit) => _appbarRemoveLastTitle(event, emit));
  }

  _appbarAddTitle(AppbarAddTitle event, Emitter<AppbarState> emit) {
    List<String> titleList = [];
    titleList.addAll(state.titles);
    titleList.add(event.title);
    emit.call(AppbarState(titles: titleList));
  }

  _appbarRemoveLastTitle(
      AppbarRemoveLastTitle event, Emitter<AppbarState> emit) {
    List<String> titleList = [];
    titleList.addAll(state.titles);
    titleList.removeLast();
    emit.call(AppbarState(titles: titleList));
  }
}
