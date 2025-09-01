class NcpFeedBackLocationEntity {
  int? count;
  int? filtered;
  List<ListElementEntity>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  NcpFeedBackLocationEntity({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory NcpFeedBackLocationEntity.fromJson(Map<String, dynamic> json) =>
      NcpFeedBackLocationEntity(
        count: json["Count"],
        filtered: json["Filtered"],
        list: json["List"] != null
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
  int? code;
  String? createBy;
  String? createDate;
  String? description;
  String? idCompany;
  String? name;
  String? updateBy;
  String? updateDate;

  ListElementEntity({
    required this.id,
    required this.active,
    required this.code,
    required this.createBy,
    required this.createDate,
    required this.description,
    required this.idCompany,
    required this.name,
    required this.updateBy,
    required this.updateDate,
  });

  factory ListElementEntity.fromJson(Map<String, dynamic> json) =>
      ListElementEntity(
        id: json["Id"],
        active: json["Active"],
        code: json["Code"],
        createBy: json["CreateBy"],
        createDate: json["CreateDate"],
        description: json["Description"],
        idCompany: json["IdCompany"],
        name: json["Name"],
        updateBy: json["UpdateBy"],
        updateDate: json["UpdateDate"],
      );
}
