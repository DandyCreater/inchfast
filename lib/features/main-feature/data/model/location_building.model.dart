import '../../domain/entity/location_building.entity.dart';

class LocationBuildingModel {
  int? count;
  int? filtered;
  List<ListElement>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  LocationBuildingModel({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory LocationBuildingModel.fromJson(Map<String, dynamic> json) =>
      LocationBuildingModel(
        count: json["Count"],
        filtered: json["Filtered"],
        list: List<ListElement>.from(
            json["List"].map((x) => ListElement.fromJson(x))),
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
  LocationBuildingEntity toEntity() {
    return LocationBuildingEntity(
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
  String? code;
  String? name;

  ListElement({
    required this.id,
    required this.code,
    required this.name,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["Id"],
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
