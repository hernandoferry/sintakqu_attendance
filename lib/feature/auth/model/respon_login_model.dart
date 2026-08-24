import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'respon_login_model.g.dart';

ResponLoginModel responLoginModelFromJson(String str) =>
    ResponLoginModel.fromJson(json.decode(str));

String responLoginModelToJson(ResponLoginModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ResponLoginModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  ResponLoginModel({this.success, this.message, this.data});

  factory ResponLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ResponLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponLoginModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  User? user;

  Data({this.token, this.user});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "company_id")
  int? companyId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "role")
  String? role;

  User({
    this.id,
    this.companyId,
    this.name,
    this.email,
    this.phone,
    this.status,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
