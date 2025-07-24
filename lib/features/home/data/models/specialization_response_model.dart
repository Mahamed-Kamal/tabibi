import 'package:json_annotation/json_annotation.dart';
part 'specialization_response_model.g.dart';


@JsonSerializable()
class SpecializationResponseModel {

  final String? message;
  final List<Data>? data;
  final bool? status;
  final int? code;

  const SpecializationResponseModel({
    this.message,
    this.data,
    this.status,
    this.code,
  });
  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) => _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  final int? id;
  final String? name;
  final List<Doctors>? doctors;

  const Data({this.id, this.name, this.doctors});

  factory Data.fromJson(dynamic json) => _$DataFromJson(json);
}

@JsonSerializable()
class Doctors {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  final String? degree;
  final int? appointPrice;

  const Doctors({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.degree,
    this.appointPrice,

  });

  factory Doctors.fromJson(dynamic json) => _$DoctorsFromJson(json);
}





