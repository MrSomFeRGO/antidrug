part of 'snackbar_display_bloc.dart';

abstract class SnackbarDisplayState extends Equatable {
  const SnackbarDisplayState();
}

class SnackbarDisplayNone extends SnackbarDisplayState {
  @override
  List<Object> get props => [];
}

class SnackbarDisplayError extends SnackbarDisplayState {
  const SnackbarDisplayError({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  List<Object> get props => [title, desc];
}

class SnackbarDisplayWarning extends SnackbarDisplayState {
  const SnackbarDisplayWarning({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  List<Object> get props => [title, desc];
}

class SnackbarDisplaySuccess extends SnackbarDisplayState {
  const SnackbarDisplaySuccess({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  List<Object> get props => [title, desc];
}

class SnackbarDisplayInfo extends SnackbarDisplayState {
  const SnackbarDisplayInfo({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  List<Object> get props => [title, desc];
}

class SnackbarDisplayInfoWithButton extends SnackbarDisplayState {
  const SnackbarDisplayInfoWithButton({
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
