class LocationRackEntity {
  DataEntity? data;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  LocationRackEntity({
    required this.data,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory LocationRackEntity.fromJson(Map<String, dynamic> json) =>
      LocationRackEntity(
        data: (json["Data"] != null) ? DataEntity.fromJson(json["Data"]) : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
}

class DataEntity {
  String? id;
  String? idCompany;
  String? idLocationArea;
  String? areaName;
  String? areaCode;
  String? code;
  String? name;
  bool? active;
  String? partNo;
  String? partName;
  String? es1;
  String? es2;
  int? quantity;
  String? remarks;
  String? updateBy;
  String? updateDate;

  DataEntity({
    required this.id,
    required this.idCompany,
    required this.idLocationArea,
    required this.areaName,
    required this.areaCode,
    required this.code,
    required this.name,
    required this.active,
    required this.partNo,
    required this.partName,
    required this.es1,
    required this.es2,
    required this.quantity,
    required this.remarks,
    required this.updateBy,
    required this.updateDate,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) => DataEntity(
        id: json["Id"],
        idCompany: json["IdCompany"],
        idLocationArea: json["IdLocationArea"],
        areaName: json["AreaName"],
        areaCode: json["AreaCode"],
        code: json["Code"],
        name: json["Name"],
        active: json["Active"],
        partNo: json["PartNo"],
        partName: json["PartName"],
        es1: json["Es1"],
        es2: json["Es2"],
        quantity: json["Quantity"],
        remarks: json["Remarks"],
        updateBy: json["UpdateBy"],
        updateDate: json["UpdateDate"],
      );
}
