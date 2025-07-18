import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? message;
  final Data? data;
  final bool? status;
  final int? code;
  const LoginResponse({
      this.message, 
      this.data,
      this.status, 
      this.code,
  });

  factory LoginResponse.fromJson(dynamic json) =>_$LoginResponseFromJson(json);

}

@JsonSerializable()
class Data {
  final String? token;
  final String? username;
  const Data({
      this.token, 
      this.username,
  });
  factory Data.fromJson(dynamic json) => _$DataFromJson(json);



}