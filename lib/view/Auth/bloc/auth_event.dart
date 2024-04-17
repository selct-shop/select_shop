part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLogInEvent extends AuthEvent {}
final class AuthSignupEvet extends AuthEvent {}
// final class AuthLogInEvent extends AuthEvent {}
// final class AuthLogInEvent extends AuthEvent {}