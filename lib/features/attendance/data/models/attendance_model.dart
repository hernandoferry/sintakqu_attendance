import 'package:json_annotation/json_annotation.dart';

part 'attendance_model.g.dart';

@JsonSerializable()
class AttendanceModel {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final String date;
  @JsonKey(name: 'check_in')
  final String? checkIn;
  @JsonKey(name: 'check_out')
  final String? checkOut;
  @JsonKey(name: 'lat_check_in')
  final String? latCheckIn;
  @JsonKey(name: 'long_check_in')
  final String? longCheckIn;
  @JsonKey(name: 'lat_check_out')
  final String? latCheckOut;
  @JsonKey(name: 'long_check_out')
  final String? longCheckOut;
  final String status; // e.g., 'PRESENT', 'LATE', 'ABSENT'

  AttendanceModel({
    required this.id,
    required this.userId,
    required this.date,
    this.checkIn,
    this.checkOut,
    this.latCheckIn,
    this.longCheckIn,
    this.latCheckOut,
    this.longCheckOut,
    required this.status,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => _$AttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceModelToJson(this);
}
