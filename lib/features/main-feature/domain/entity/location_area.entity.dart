class LocationAreaEntity {
  int? count;
  int? filtered;
  List<ListElementEntity>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  LocationAreaEntity({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory LocationAreaEntity.fromJson(Map<String, dynamic> json) =>
      LocationAreaEntity(
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
  String id;
  BuildingEntity? building;
  String? code;
  String? name;

  ListElementEntity({
    required this.id,
    this.building,
    required this.code,
    required this.name,
  });

  factory ListElementEntity.fromJson(Map<String, dynamic> json) =>
      ListElementEntity(
        id: json["Id"],
        building: json["Building"] == null
            ? null
            : BuildingEntity.fromJson(json["Building"]),
        code: json["Code"],
        name: json["Name"],
      );
}

class BuildingEntity {
  String? id;
  String? code;
  String? name;

  BuildingEntity({
    required this.id,
    required this.code,
    required this.name,
  });

  factory BuildingEntity.fromJson(Map<String, dynamic> json) => BuildingEntity(
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
      );
}
