import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../repository/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with ChangeNotifier {
  final AuthenticationRepository authenticationRepository;
  StreamSubscription<AuthenticationStatus>? authenticationStatusSubscription;

  AuthenticationBloc({required this.authenticationRepository})
      : super(const AuthenticationState.unknown()) {
    authenticationRepository.authenticateUser();

    authenticationStatusSubscription = authenticationRepository.status.listen(
      (status) {
        add(AuthenticationStatusChanged(status));
      },
    );
    on<AuthenticationStatusChanged>((event, emit) {
      switch (event.status) {
        case AuthenticationStatus.unauthenticated:
          emit(const AuthenticationState.unauthenticated());
          break;
        case AuthenticationStatus.authenticated:
          emit(const AuthenticationState.authenticated());
          break;
        default:
          emit(const AuthenticationState.unknown());
          break;
      }
      notifyListeners();
    });
    on<AuthenticationLogoutRequested>(((event, emit) {
      emit(const AuthenticationState.unauthenticated());
      notifyListeners();
    }));
  }
}
