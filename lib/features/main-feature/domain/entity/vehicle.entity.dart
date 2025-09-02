class VehicleEntity {
  int? count;
  int? filtered;
  List<ListElementEntity>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  VehicleEntity({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory VehicleEntity.fromJson(Map<String, dynamic> json) => VehicleEntity(
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
  String? bmCode;
  String? code;
  String? description;
  TypeEntity? type;
  String? name;
  int? sort;
  String? idRepositoryImage;

  ListElementEntity({
    required this.id,
    required this.bmCode,
    required this.code,
    required this.description,
    required this.type,
    required this.name,
    required this.sort,
    required this.idRepositoryImage,
  });

  factory ListElementEntity.fromJson(Map<String, dynamic> json) =>
      ListElementEntity(
        id: json["Id"],
        bmCode: json["BmCode"],
        code: json["Code"],
        description: json["Description"],
        type: TypeEntity.fromJson(json["Type"]),
        name: json["Name"],
        sort: json["Sort"],
        idRepositoryImage: json["IdRepositoryImage"],
      );
}

class TypeEntity {
  String? id;
  String? code;
  String? name;
  int? sort;
  CategoryEntity? category;

  TypeEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.sort,
    required this.category,
  });

  factory TypeEntity.fromJson(Map<String, dynamic> json) => TypeEntity(
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
        sort: json["Sort"],
        category: CategoryEntity.fromJson(json["Category"]),
      );
}

class CategoryEntity {
  String id;
  String nama;

  CategoryEntity({
    required this.id,
    required this.nama,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => CategoryEntity(
        id: json["Id"],
        nama: json["Nama"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nama": nama,
      };
}
