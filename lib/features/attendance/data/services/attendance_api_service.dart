import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/attendance_model.dart';

part 'attendance_api_service.g.dart';

@RestApi()
abstract class AttendanceApiService {
  factory AttendanceApiService(Dio dio, {String baseUrl}) = _AttendanceApiService;

  @POST(ApiEndpoints.checkIn)
  Future<AttendanceModel> checkIn(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiEndpoints.checkOut)
  Future<AttendanceModel> checkOut(
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiEndpoints.attendanceStatus)
  Future<AttendanceModel?> getTodayStatus();

  @GET(ApiEndpoints.attendanceHistory)
  Future<List<AttendanceModel>> getHistory();
}
