class LocationBuildingEntity {
  int? count;
  int? filtered;
  List<ListElementEntity>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  LocationBuildingEntity({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory LocationBuildingEntity.fromJson(Map<String, dynamic> json) =>
      LocationBuildingEntity(
        count: json["Count"],
        filtered: json["Filtered"],
        list: List<ListElementEntity>.from(
            json["List"].map((x) => ListElementEntity.fromJson(x))),
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
}

class ListElementEntity {
  String? id;
  String? code;
  String? name;

  ListElementEntity({
    required this.id,
    required this.code,
    required this.name,
  });

  factory ListElementEntity.fromJson(Map<String, dynamic> json) =>
      ListElementEntity(
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
      );
}
