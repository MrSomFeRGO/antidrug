part of 'snackbar_display_bloc.dart';

abstract class SnackbarDisplayingEvent extends Equatable {
  const SnackbarDisplayingEvent();
}

class SnackbarDisplayingError extends SnackbarDisplayingEvent {
  const SnackbarDisplayingError({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  List<Object> get props => [title, desc];
}

class SnackbarDisplayingWarning extends SnackbarDisplayingEvent {
  const SnackbarDisplayingWarning({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  List<Object> get props => [title, desc];
}

class SnackbarDisplayingSuccess extends SnackbarDisplayingEvent {
  const SnackbarDisplayingSuccess({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  List<Object> get props => [title, desc];
}

class SnackbarDisplayingInfo extends SnackbarDisplayingEvent {
  const SnackbarDisplayingInfo({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  List<Object> get props => [title, desc];
}

class SnackbarDisplayingInfoWithButton extends SnackbarDisplayingEvent {
  const SnackbarDisplayingInfoWithButton({
    required this.title,
    required this.desc,
    required this.buttonTitle,
    required this.onTap,
  });

  final String title;
  final String desc;
  final void Function() onTap;
  final String buttonTitle;

  @override
  List<Object> get props => [title, desc];
}
