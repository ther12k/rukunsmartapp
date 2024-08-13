part of 'auth_bloc.dart';

abstract class AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String username;
  final String password;

  AuthLoginRequested({required this.username, required this.password});
}

class AuthLogoutRequested extends AuthEvent {}
