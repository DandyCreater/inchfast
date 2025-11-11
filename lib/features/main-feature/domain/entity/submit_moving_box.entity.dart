class SubmitMovingBoxEntity {
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  SubmitMovingBoxEntity({
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory SubmitMovingBoxEntity.fromJson(Map<String, dynamic> json) =>
      SubmitMovingBoxEntity(
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
}
