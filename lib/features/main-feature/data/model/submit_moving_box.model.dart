import 'package:inchfast/features/main-feature/domain/entity/submit_moving_box.entity.dart';

class SubmitMovingBoxModel {
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  SubmitMovingBoxModel({
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory SubmitMovingBoxModel.fromJson(Map<String, dynamic> json) =>
      SubmitMovingBoxModel(
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );

  SubmitMovingBoxEntity toEntity() {
    return SubmitMovingBoxEntity(
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}
