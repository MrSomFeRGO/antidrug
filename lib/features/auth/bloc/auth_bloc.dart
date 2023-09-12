import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) => _loginEvent(event, emit));
    on<TryLoginFromCacheEvent>((event, emit) => _tryLoginFromCacheEvent(event,emit));
    on<GuestLoginEvent>((event, emit) => _guestLoginEvent(event, emit));
  }

  _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit.call(LoginLoading());
    await Future.delayed(const Duration(seconds: 5));
    emit.call(LoginSuccess());
  }

  _tryLoginFromCacheEvent(TryLoginFromCacheEvent event, Emitter<AuthState> emit) {
    emit.call(LoginLoading());
  }

  _guestLoginEvent(GuestLoginEvent event, Emitter<AuthState> emit) async {
    emit.call(LoginLoading());
    await Future.delayed(const Duration(seconds: 5));
    emit.call(LoginSuccess());
  }
}
