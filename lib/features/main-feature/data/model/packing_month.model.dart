import '../../domain/entity/packing_month.entity.dart';

class PackingMonthModel {
  int? count;
  int? filtered;
  List<dynamic>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  PackingMonthModel({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory PackingMonthModel.fromJson(Map<String, dynamic> json) =>
      PackingMonthModel(
        count: json["Count"],
        filtered: json["Filtered"],
        list: json["List"],
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );

  PackingMonthEntity toEntity() {
    return PackingMonthEntity(
      count: count,
      filtered: filtered,
      list: list,
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}
