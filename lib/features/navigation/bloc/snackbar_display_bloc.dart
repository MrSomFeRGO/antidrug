import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'snackbar_display_event.dart';
part 'snackbar_display_state.dart';

class SnackbarDisplayBloc
    extends Bloc<SnackbarDisplayingEvent, SnackbarDisplayState> {
  SnackbarDisplayBloc() : super(SnackbarDisplayNone()) {
    on<SnackbarDisplayingError>((event, emit) {
      emit.call(SnackbarDisplayError(title: event.title, desc: event.desc));
      emit.call(SnackbarDisplayNone());
    });
    on<SnackbarDisplayingWarning>((event, emit) {
      emit.call(SnackbarDisplayWarning(title: event.title, desc: event.desc));
      emit.call(SnackbarDisplayNone());
    });
    on<SnackbarDisplayingSuccess>((event, emit) {
      emit.call(SnackbarDisplaySuccess(title: event.title, desc: event.desc));
      emit.call(SnackbarDisplayNone());
    });
    on<SnackbarDisplayingInfo>((event, emit) {
      emit.call(SnackbarDisplayInfo(title: event.title, desc: event.desc));
      emit.call(SnackbarDisplayNone());
    });
    on<SnackbarDisplayingInfoWithButton>((event, emit) {
      emit.call(SnackbarDisplayInfoWithButton(
          title: event.title,
          desc: event.desc,
          onTap: event.onTap,
          buttonTitle: event.buttonTitle));
      emit.call(SnackbarDisplayNone());
    });
  }
}
