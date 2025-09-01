import '../../domain/entity/ncp_number.entity.dart';

class NcpNumberModel {
  Data? data;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  NcpNumberModel({
    required this.data,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory NcpNumberModel.fromJson(Map<String, dynamic> json) => NcpNumberModel(
        data: json["Data"] != null ? Data.fromJson(json["Data"]) : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
  NcpNumberEntity toEntity() {
    return NcpNumberEntity(
      data: data?.toEntity(),
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}

class Data {
  String? prefixNo;
  String? ncpNumber;

  Data({
    required this.prefixNo,
    required this.ncpNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        prefixNo: json["PrefixNo"],
        ncpNumber: json["NcpNumber"],
      );

  DataEntity toEntity() {
    return DataEntity(
      prefixNo: prefixNo,
      ncpNumber: ncpNumber,
    );
  }
}
