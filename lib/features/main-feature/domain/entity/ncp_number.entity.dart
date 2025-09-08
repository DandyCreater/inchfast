class NcpNumberEntity {
  DataEntity? data;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  NcpNumberEntity({
    required this.data,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory NcpNumberEntity.fromJson(Map<String, dynamic> json) =>
      NcpNumberEntity(
        data: json["Data"] != null ? DataEntity.fromJson(json["Data"]) : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
}

class DataEntity {
  String? prefixNo;
  String? ncpNumber;

  DataEntity({
    required this.prefixNo,
    required this.ncpNumber,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) => DataEntity(
        prefixNo: json["PrefixNo"],
        ncpNumber: json["NcpNumber"],
      );
}
