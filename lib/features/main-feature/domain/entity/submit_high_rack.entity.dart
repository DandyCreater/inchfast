class SubmitHighRackEntity {
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  SubmitHighRackEntity({
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory SubmitHighRackEntity.fromJson(Map<String, dynamic> json) =>
      SubmitHighRackEntity(
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
