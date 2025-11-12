import 'package:inchfast/features/main-feature/domain/entity/unloading_location.entity.dart';

class UnloadingLocationModel {
  int? count;
  int? filtered;
  List<ListElement>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  UnloadingLocationModel({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory UnloadingLocationModel.fromJson(Map<String, dynamic> json) =>
      UnloadingLocationModel(
        count: json["Count"],
        filtered: json["Filtered"],
        list: List<ListElement>.from(
            json["List"].map((x) => ListElement.fromJson(x))),
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
  UnloadingLocationEntity toEntity() {
    return UnloadingLocationEntity(
      count: count,
      filtered: filtered,
      list: list?.map((x) => x.toEntity()).toList(),
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}

class ListElement {
  String? id;
  Area? area;
  String? code;
  String? name;
  String? description;
  bool? active;
  String? createBy;
  String? createDate;
  String? updateBy;
  String? updateDate;

  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["Id"],
        area: Area.fromJson(json["Area"]),
        code: json["Code"],
        name: json["Name"],
        description: json["Description"],
        active: json["Active"],
        createBy: json["CreateBy"],
        createDate: json["CreateDate"],
        updateBy: json["UpdateBy"],
        updateDate: json["UpdateDate"],
      );

  ListElementEntity toEntity() {
    return ListElementEntity(
      id: id,
      area: area?.toEntity(),
      code: code,
      name: name,
      description: description,
      active: active,
      createBy: createBy,
      createDate: createDate,
      updateBy: updateBy,
      updateDate: updateDate,
    );
  }
}

class Area {
  String? id;
  Area? building;
  String? code;
  String? name;

  Area({
    required this.id,
    this.building,
    required this.code,
    required this.name,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["Id"],
        building:
            json["Building"] == null ? null : Area.fromJson(json["Building"]),
        code: json["Code"],
        name: json["Name"],
      );

  AreaEntity toEntity() {
    return AreaEntity(
      id: id,
      code: code,
      name: name,
    );
  }
}

class Building {
  String? id;
  String? code;
  String? name;

  Building({
    required this.id,
    required this.code,
    required this.name,
  });

  factory Building.fromJson(Map<String, dynamic> json) => Building(
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
      );

  BuildingEntity toEntity() {
    return BuildingEntity(
      id: id,
      code: code,
      name: name,
    );
  }
}
