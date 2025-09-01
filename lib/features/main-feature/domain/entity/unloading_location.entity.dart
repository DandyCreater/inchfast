class UnloadingLocationEntity {
  int? count;
  int? filtered;
  List<ListElementEntity>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  UnloadingLocationEntity({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory UnloadingLocationEntity.fromJson(Map<String, dynamic> json) =>
      UnloadingLocationEntity(
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
  AreaEntity? area;
  String? code;
  String? name;
  String? description;
  bool? active;
  String? createBy;
  String? createDate;
  String? updateBy;
  String? updateDate;

  ListElementEntity({
    required this.id,
    required this.area,
    required this.code,
    required this.name,
    required this.description,
    required this.active,
    required this.createBy,
    required this.createDate,
    required this.updateBy,
    required this.updateDate,
  });

  factory ListElementEntity.fromJson(Map<String, dynamic> json) =>
      ListElementEntity(
        id: json["Id"],
        area: AreaEntity.fromJson(json["Area"]),
        code: json["Code"],
        name: json["Name"],
        description: json["Description"],
        active: json["Active"],
        createBy: json["CreateBy"],
        createDate: json["CreateDate"],
        updateBy: json["UpdateBy"],
        updateDate: json["UpdateDate"],
      );
}

class AreaEntity {
  String? id;
  BuildingEntity? building;
  String? code;
  String? name;

  AreaEntity({
    required this.id,
    this.building,
    required this.code,
    required this.name,
  });

  factory AreaEntity.fromJson(Map<String, dynamic> json) => AreaEntity(
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
