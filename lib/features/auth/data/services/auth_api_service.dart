import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/user_model.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiEndpoints.login)
  Future<HttpResponse<Map<String, dynamic>>> login(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiEndpoints.logout)
  Future<void> logout();

  @GET(ApiEndpoints.profile)
  Future<UserModel> getProfile();
}
