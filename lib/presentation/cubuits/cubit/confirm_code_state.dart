part of 'confirm_code_cubit.dart';

@immutable
sealed class ConfirmCodeState {}

final class ConfirmCodeInitial extends ConfirmCodeState {}

final class ConfirmCodeLoading extends ConfirmCodeState {}

final class ConfirmCodeError extends ConfirmCodeState {
  final String errorText;
  ConfirmCodeError({required this.errorText});
}

final class ConfirmCodeSuccess extends ConfirmCodeState {
  final String message;
  ConfirmCodeSuccess({
    required this.message,
  });
}
