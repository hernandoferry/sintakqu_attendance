import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //Deklarasikan variabel private untuk menampung instance Dio
  final Dio _dio;

  AuthBloc(this._dio) : super(AuthInitial()) {
    on<AuthLoginSubmitted>((event, emit) async {
      // set ke authloading dulu
      emit(AuthLoading());

      try {
        //set endpoint login dengan dio
        final response = await _dio.post(
          'auth/login',
          data: {
            'email': event.email, //ambil data dari construktor event
            'password': event.password, //ambil data dari construktor event
          },
        );

        //Jika sukses, ambil token dari response API
        final token = response
            .data['data']['token']; // Sesuaikan dengan key JSON dari API

        // Oper token ke state AuthSuccess agar bisa dipakai di UI
        emit(AuthSuccess(token: token));
      } on DioException catch (e) {
        final errorMessage =
            e.response?.data['message'] ?? 'Terjadi kesalahan jaringan';
        emit(AuthFailure(error: errorMessage));
      } catch (e) {
        // handle error tidak terduga
        emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
