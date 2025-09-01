import '../../domain/entity/location_section.entity.dart';

class LocationSectionModel {
  int? count;
  int? filtered;
  List<ListElement>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  LocationSectionModel({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory LocationSectionModel.fromJson(Map<String, dynamic> json) =>
      LocationSectionModel(
        count: json["Count"],
        filtered: json["Filtered"],
        list: List<ListElement>.from(
            json["List"].map((x) => ListElement.fromJson(x))),
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );

  LocationSectionEntity toEntity() {
    return LocationSectionEntity(
      count: count,
      filtered: filtered,
      list: list!.map((x) => x.toEntity()).toList(),
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

  ListElement({
    required this.id,
    required this.area,
    required this.code,
    required this.name,
    required this.description,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["Id"],
        area: json["Area"] != null ? Area.fromJson(json["Area"]) : null,
        code: json["Code"],
        name: json["Name"],
        description: json["Description"],
      );

  ListElementEntity toEntity() {
    return ListElementEntity(
      id: id,
      area: area?.toEntity(),
      code: code,
      name: name,
      description: description,
    );
  }
}

class Area {
  String id;
  Building? building;
  String code;
  String name;

  Area({
    required this.id,
    this.building,
    required this.code,
    required this.name,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["Id"],
        building: json["Building"] == null
            ? null
            : Building.fromJson(json["Building"]),
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
