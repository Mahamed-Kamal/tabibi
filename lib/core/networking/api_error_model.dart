import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';
@JsonSerializable()

class ApiErrorModel {
  final String? message;
  final int? code;
  final Map<String,dynamic>? data;

  const ApiErrorModel({
    this.data,
    this.message,
    this.code
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessage() {
    if (data == null && data!.isEmpty) {
      return message ?? " UnKnown Error occurred";
    }

    final errorMessage = data!.entries.map((entry) {
      final value = entry.value;
      return "${value.join(',')}";
    }).join("\n");

    return errorMessage;
  }
}
