import '../../domain/entity/submit_ncp.entity.dart';

class SubmitNcpModel {
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  SubmitNcpModel({
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory SubmitNcpModel.fromJson(Map<String, dynamic> json) => SubmitNcpModel(
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

  SubmitNcpEntity toEntity() {
    return SubmitNcpEntity(
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}
