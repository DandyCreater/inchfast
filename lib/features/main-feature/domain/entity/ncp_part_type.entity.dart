class NcpPartTypeEntity {
  int? count;
  int? filtered;
  List<ListElementEntity>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  NcpPartTypeEntity({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory NcpPartTypeEntity.fromJson(Map<String, dynamic> json) =>
      NcpPartTypeEntity(
        count: json["Count"],
        filtered: json["Filtered"],
        list: (json["List"] != null)
            ? List<ListElementEntity>.from(
                json["List"].map((x) => ListElementEntity.fromJson(x)))
            : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
}

class ListElementEntity {
  String? id;
  bool? active;
  String? createBy;
  String? createDate;
  String? description;
  String? idCompany;
  String? name;
  int? sort;
  String? type;
  String? updateBy;
  String? updateDate;

  ListElementEntity({
    required this.id,
    required this.active,
    required this.createBy,
    required this.createDate,
    required this.description,
    required this.idCompany,
    required this.name,
    required this.sort,
    required this.type,
    required this.updateBy,
    required this.updateDate,
  });

  factory ListElementEntity.fromJson(Map<String, dynamic> json) =>
      ListElementEntity(
        id: json["Id"],
        active: json["Active"],
        createBy: json["CreateBy"],
        createDate: json["CreateDate"],
        description: json["Description"],
        idCompany: json["IdCompany"],
        name: json["Name"],
        sort: json["Sort"],
        type: json["Type"],
        updateBy: json["UpdateBy"],
        updateDate: json["UpdateDate"],
      );
}
