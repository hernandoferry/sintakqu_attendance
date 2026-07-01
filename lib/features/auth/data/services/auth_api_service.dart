import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/login_response_model.dart';
import '../models/user_model.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  // String? baseUrl → nullable agar tidak wajib diisi saat instansiasi
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  // Return LoginResponseModel langsung agar retrofit_generator bisa parse dengan benar
  // Tidak lagi pakai Map<String, dynamic> yang menyebabkan `dynamic.fromJson()` error di .g.dart
  @POST(ApiEndpoints.login)
  Future<HttpResponse<LoginResponseModel>> login(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiEndpoints.logout)
  Future<void> logout();

  @GET(ApiEndpoints.profile)
  Future<UserModel> getProfile();
}
