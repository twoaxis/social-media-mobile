part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpError extends SignUpState {
  final String message;

  SignUpError({required this.message});
}
