class UnloadingStatusEntity {
  int? count;
  int? filtered;
  List<ListElementEntity>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  UnloadingStatusEntity({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory UnloadingStatusEntity.fromJson(Map<String, dynamic> json) =>
      UnloadingStatusEntity(
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
  int? id;
  String? nama;

  ListElementEntity({
    required this.id,
    required this.nama,
  });

  factory ListElementEntity.fromJson(Map<String, dynamic> json) =>
      ListElementEntity(
        id: json["Id"],
        nama: json["Nama"],
      );
}
