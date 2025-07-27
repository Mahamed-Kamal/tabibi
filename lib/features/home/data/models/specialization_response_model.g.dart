// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationResponseModel _$SpecializationResponseModelFromJson(
  Map<String, dynamic> json,
) => SpecializationResponseModel(
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map(Data.fromJson).toList(),
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
);



Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  doctors: (json['doctors'] as List<dynamic>?)?.map(Doctors.fromJson).toList(),
);



Doctors _$DoctorsFromJson(Map<String, dynamic> json) => Doctors(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  gender: json['gender'] as String?,
  degree: json['degree'] as String?,
  appointPrice: (json['appointPrice'] as num?)?.toInt(),
);

