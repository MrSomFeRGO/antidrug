import 'package:antidrugs/core/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc()
      : super(
          const NavigationState(bottomNavItems: Routes.feedNamedPage, index: 0),
        ) {
    on<ChangePageEvent>((event, emit) {
      _changePage(event.index, emit);
    });
  }

  void _changePage(int index, Emitter<NavigationState> emit) {
    switch (index) {
      case 0:
        emit(const NavigationState(
            bottomNavItems: Routes.feedNamedPage, index: 0));
        break;
      case 1:
        emit(const NavigationState(
            bottomNavItems: Routes.motivationNamedPage, index: 1));
        break;
      case 2:
        emit(const NavigationState(
            bottomNavItems: Routes.denunciationNamedPage, index: 2));
        break;
    }
  }
}
