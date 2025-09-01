import '../../domain/entity/location_area.entity.dart';

class LocationAreaModel {
  int? count;
  int? filtered;
  List<ListElement>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  LocationAreaModel({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory LocationAreaModel.fromJson(Map<String, dynamic> json) =>
      LocationAreaModel(
        count: json["Count"],
        filtered: json["Filtered"],
        list: List<ListElement>.from(
            json["List"].map((x) => ListElement.fromJson(x))),
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );

  LocationAreaEntity toEntity() {
    return LocationAreaEntity(
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
  String id;
  Building? building;
  String? code;
  String? name;

  ListElement({
    required this.id,
    this.building,
    required this.code,
    required this.name,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["Id"],
        building: json["Building"] == null
            ? null
            : Building.fromJson(json["Building"]),
        code: json["Code"],
        name: json["Name"],
      );

  ListElementEntity toEntity() {
    return ListElementEntity(
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
