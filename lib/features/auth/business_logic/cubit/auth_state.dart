part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class Success extends AuthState {
  final AuthModel user;

  Success(this.user);
}

class Error extends AuthState {
  final String errorText;

  Error(this.errorText);
}

class ErroHiding extends AuthState {}

class AddedUser extends AuthState{}
