part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  const LoginEvent(
    this.fio,
    this.phone,
    this.password,
    this.toSave,
  );

  final String fio;
  final String phone;
  final String password;
  final bool toSave;

  @override
  List<Object?> get props => [fio, phone, password, toSave];
}

class TryLoginFromCacheEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class GuestLoginEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
