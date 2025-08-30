class PackingMonthEntity {
  int? count;
  int? filtered;
  List<dynamic>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  PackingMonthEntity({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory PackingMonthEntity.fromJson(Map<String, dynamic> json) =>
      PackingMonthEntity(
        count: json["Count"],
        filtered: json["Filtered"],
        list: json["List"],
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
}
