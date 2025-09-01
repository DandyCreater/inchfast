import '../../domain/entity/ncp_part_type.entity.dart';

class NcpPartTypeModel {
  int? count;
  int? filtered;
  List<ListElement>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  NcpPartTypeModel({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory NcpPartTypeModel.fromJson(Map<String, dynamic> json) =>
      NcpPartTypeModel(
        count: json["Count"],
        filtered: json["Filtered"],
        list: (json["List"] != null)
            ? List<ListElement>.from(
                json["List"].map((x) => ListElement.fromJson(x)))
            : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );

  NcpPartTypeEntity toEntity() {
    return NcpPartTypeEntity(
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

  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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

  ListElementEntity toEntity() {
    return ListElementEntity(
      id: id,
      active: active,
      createBy: createBy,
      createDate: createDate,
      description: description,
      idCompany: idCompany,
      name: name,
      sort: sort,
      type: type,
      updateBy: updateBy,
      updateDate: updateDate,
    );
  }
}
