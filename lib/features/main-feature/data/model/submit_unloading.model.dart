import 'package:inchfast/features/main-feature/domain/entity/submit_unloading.entity.dart';

class SubmitUnloadingModel {
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  SubmitUnloadingModel({
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory SubmitUnloadingModel.fromJson(Map<String, dynamic> json) =>
      SubmitUnloadingModel(
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

  SubmitUnloadingEntity toEntity() {
    return SubmitUnloadingEntity(
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}
