class SubmitNcpEntity {
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  SubmitNcpEntity({
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory SubmitNcpEntity.fromJson(Map<String, dynamic> json) =>
      SubmitNcpEntity(
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
