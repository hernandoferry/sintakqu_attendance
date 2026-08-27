part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

// 1. buat state awal saat aplikasi dibuka
final class AuthInitial extends AuthState {}

// 2. state ketika sedang proses loading
final class AuthLoading extends AuthState {}

// 3. State saat login berhasil dan menerima token
final class AuthSuccess extends AuthState {
  final String token;
  AuthSuccess({required this.token});
}

// 4. State saat login gagal (misal: password salah atau server down)
final class AuthFailure extends AuthState {
  final String error;
  AuthFailure({required this.error});
}
