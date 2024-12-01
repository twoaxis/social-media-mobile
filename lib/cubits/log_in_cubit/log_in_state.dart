part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInLoading extends LogInState {}

final class LogInSuccess extends LogInState {
  final String message;

  LogInSuccess({required this.message});
}

final class LogInError extends LogInState {
  final String message;

  LogInError({required this.message});
}

final class LogInEmailVerification extends LogInState {
  final String sessionId;

  LogInEmailVerification({required this.sessionId});
}
