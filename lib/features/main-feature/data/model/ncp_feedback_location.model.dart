import '../../domain/entity/ncp_feedback_location.entity.dart';

class NcpFeedBackLocationModel {
  int? count;
  int? filtered;
  List<ListElement>? list;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  NcpFeedBackLocationModel({
    required this.count,
    required this.filtered,
    required this.list,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory NcpFeedBackLocationModel.fromJson(Map<String, dynamic> json) =>
      NcpFeedBackLocationModel(
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

  NcpFeedBackLocationEntity toEntity() {
    return NcpFeedBackLocationEntity(
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
  int? code;
  String? createBy;
  String? createDate;
  String? description;
  String? idCompany;
  String? name;
  String? updateBy;
  String? updateDate;

  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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

  ListElementEntity toEntity() {
    return ListElementEntity(
      id: id,
      active: active,
      code: code,
      createBy: createBy,
      createDate: createDate,
      description: description,
      idCompany: idCompany,
      name: name,
      updateBy: updateBy,
      updateDate: updateDate,
    );
  }
}
