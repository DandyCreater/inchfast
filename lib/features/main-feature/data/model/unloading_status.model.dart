import '../../domain/entity/unloading_status.entity.dart';

class UnloadingStatusModel {
  int? count;
  int? filtered;
  List<ListElement>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  UnloadingStatusModel({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory UnloadingStatusModel.fromJson(Map<String, dynamic> json) =>
      UnloadingStatusModel(
        count: json["Count"],
        filtered: json["Filtered"],
        list: List<ListElement>.from(
            json["List"].map((x) => ListElement.fromJson(x))),
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
  UnloadingStatusEntity toEntity() {
    return UnloadingStatusEntity(
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
  int? id;
  String? nama;

  ListElement({
    required this.id,
    required this.nama,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["Id"],
        nama: json["Nama"],
      );

  ListElementEntity toEntity() {
    return ListElementEntity(
      id: id,
      nama: nama,
    );
  }
}
