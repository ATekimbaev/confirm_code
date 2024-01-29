part of 'registr_cubit.dart';

@immutable
sealed class RegistrState {}

final class RegistrInitial extends RegistrState {}

final class RegistrLoading extends RegistrState {}

final class RegistrError extends RegistrState {
  final String errorText;
  RegistrError({required this.errorText});
}

final class RegistrSuccess extends RegistrState {
  final String message;
  RegistrSuccess({
    required this.message,
  });
}
