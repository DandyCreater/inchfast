import '../../domain/entity/vehicle.entity.dart';

class VehicleModel {
  int? count;
  int? filtered;
  List<ListElement>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  VehicleModel({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        count: json["Count"],
        filtered: json["Filtered"],
        list: json["List"] != null
            ? List<ListElement>.from(
                json["List"].map((x) => ListElement.fromJson(x)))
            : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
  VehicleEntity toEntity() {
    return VehicleEntity(
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
  String? bmCode;
  String? code;
  String? description;
  Type? type;
  String? name;
  int? sort;
  String? idRepositoryImage;

  ListElement({
    required this.id,
    required this.bmCode,
    required this.code,
    required this.description,
    required this.type,
    required this.name,
    required this.sort,
    required this.idRepositoryImage,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["Id"],
        bmCode: json["BmCode"],
        code: json["Code"],
        description: json["Description"],
        type: json["Type"] != null ? Type.fromJson(json["Type"]) : null,
        name: json["Name"],
        sort: json["Sort"],
        idRepositoryImage: json["IdRepositoryImage"],
      );

  ListElementEntity toEntity() {
    return ListElementEntity(
      id: id,
      bmCode: bmCode,
      code: code,
      description: description,
      type: type?.toEntity(),
      name: name,
      sort: sort,
      idRepositoryImage: idRepositoryImage,
    );
  }
}

class Type {
  String? id;
  String? code;
  String? name;
  int? sort;
  Category? category;

  Type({
    required this.id,
    required this.code,
    required this.name,
    required this.sort,
    required this.category,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
        sort: json["Sort"],
        category: json["Category"] != null
            ? Category.fromJson(json["Category"])
            : null,
      );
  TypeEntity toEntity() {
    return TypeEntity(
      id: id,
      code: code,
      name: name,
      sort: sort,
      category: category?.toEntity(),
    );
  }
}

class Category {
  String id;
  String nama;

  Category({
    required this.id,
    required this.nama,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["Id"],
        nama: json["Nama"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nama": nama,
      };

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      nama: nama,
    );
  }
}
