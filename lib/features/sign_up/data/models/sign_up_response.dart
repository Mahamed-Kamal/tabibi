import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String? message;
  final Data? data;
  final bool? status;
  final int? code;

  const SignUpResponse({
      this.message,
      this.data, 
      this.status, 
      this.code,
  });

 factory SignUpResponse.fromJson(dynamic json) => _$SignUpResponseFromJson(json);



}


@JsonSerializable()
class Data {
  final String? token;
  final String? username;

  const Data({
      this.token, 
      this.username,});

  factory Data.fromJson(dynamic json) => _$DataFromJson(json);



}