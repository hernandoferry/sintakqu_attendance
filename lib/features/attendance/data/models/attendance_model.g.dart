// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    AttendanceModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      date: json['date'] as String,
      checkIn: json['check_in'] as String?,
      checkOut: json['check_out'] as String?,
      latCheckIn: json['lat_check_in'] as String?,
      longCheckIn: json['long_check_in'] as String?,
      latCheckOut: json['lat_check_out'] as String?,
      longCheckOut: json['long_check_out'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$AttendanceModelToJson(AttendanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'date': instance.date,
      'check_in': instance.checkIn,
      'check_out': instance.checkOut,
      'lat_check_in': instance.latCheckIn,
      'long_check_in': instance.longCheckIn,
      'lat_check_out': instance.latCheckOut,
      'long_check_out': instance.longCheckOut,
      'status': instance.status,
    };
