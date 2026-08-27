import 'package:dio/dio.dart';

Dio setDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8001/api/v1/',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  return dio;
}
