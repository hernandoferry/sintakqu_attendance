part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

// Event yang dipicu saat pengguna menekan tombol login
final class AuthLoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  // Constructor untuk menerima inputan dari UI
  AuthLoginSubmitted({required this.email, required this.password});
}
