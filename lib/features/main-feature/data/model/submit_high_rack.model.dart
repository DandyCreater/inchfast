import '../../domain/entity/submit_high_rack.entity.dart';

class SubmitHighRackModel {
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  SubmitHighRackModel({
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory SubmitHighRackModel.fromJson(Map<String, dynamic> json) =>
      SubmitHighRackModel(
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Succeeded": succeeded,
        "Message": message,
        "Description": description,
      };

  SubmitHighRackEntity toEntity() {
    return SubmitHighRackEntity(
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}
