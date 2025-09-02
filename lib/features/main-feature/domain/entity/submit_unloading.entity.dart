class SubmitUnloadingEntity {
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  SubmitUnloadingEntity({
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory SubmitUnloadingEntity.fromJson(Map<String, dynamic> json) =>
      SubmitUnloadingEntity(
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
