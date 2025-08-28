class MovingBoxEntity {
  DataEntity? data;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  MovingBoxEntity({
    required this.data,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory MovingBoxEntity.fromJson(Map<String, dynamic> json) =>
      MovingBoxEntity(
        data: DataEntity.fromJson(json["Data"]),
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
}

class DataEntity {
  String? id;
  String? packingMonth;
  String? idCompany;
  String? shipName;
  String? shipDeparture;
  String? containerNumber;
  String? fzNumberComplete;
  String? fzNumber;
  String? lot;
  String? sealNumber;
  String? size;
  String? box;
  String? modelType;
  int? quantity;
  String? boxDescription;
  String? paletteFz;
  String? locationBuilding;
  String? locationArea;
  String? idLocationSection;
  String? locationCode;
  String? locationName;
  List<DetailBoxEntity>? detailBox;

  DataEntity({
    required this.id,
    required this.packingMonth,
    required this.idCompany,
    required this.shipName,
    required this.shipDeparture,
    required this.containerNumber,
    required this.fzNumberComplete,
    required this.fzNumber,
    required this.lot,
    required this.sealNumber,
    required this.size,
    required this.box,
    required this.modelType,
    required this.quantity,
    required this.boxDescription,
    required this.paletteFz,
    required this.locationBuilding,
    required this.locationArea,
    required this.idLocationSection,
    required this.locationCode,
    required this.locationName,
    required this.detailBox,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) => DataEntity(
        id: json["Id"],
        packingMonth: json["PackingMonth"],
        idCompany: json["IdCompany"],
        shipName: json["ShipName"],
        shipDeparture: json["ShipDeparture"],
        containerNumber: json["ContainerNumber"],
        fzNumberComplete: json["FzNumberComplete"],
        fzNumber: json["FzNumber"],
        lot: json["Lot"],
        sealNumber: json["SealNumber"],
        size: json["Size"],
        box: json["Box"],
        modelType: json["ModelType"],
        quantity: json["Quantity"],
        boxDescription: json["BoxDescription"],
        paletteFz: json["PaletteFz"],
        locationBuilding: json["LocationBuilding"],
        locationArea: json["LocationArea"],
        idLocationSection: json["IdLocationSection"],
        locationCode: json["LocationCode"],
        locationName: json["LocationName"],
        detailBox: (json["DetailBox"] != null)
            ? List<DetailBoxEntity>.from(
                json["DetailBox"].map((x) => DetailBoxEntity.fromJson(x)))
            : null,
      );
}

class DetailBoxEntity {
  String? fzNumberComplete;
  String? fzNumber;
  String? lot;
  String? sealNumber;
  String? size;
  int? quantity;
  String? packageId;
  String? modelType;
  String? boxDescription;
  String? paletteFz;

  DetailBoxEntity({
    required this.fzNumberComplete,
    required this.fzNumber,
    required this.lot,
    required this.sealNumber,
    required this.size,
    required this.quantity,
    required this.packageId,
    required this.modelType,
    required this.boxDescription,
    required this.paletteFz,
  });

  factory DetailBoxEntity.fromJson(Map<String, dynamic> json) =>
      DetailBoxEntity(
        fzNumberComplete: json["FzNumberComplete"],
        fzNumber: json["FzNumber"],
        lot: json["Lot"],
        sealNumber: json["SealNumber"],
        size: json["Size"],
        quantity: json["Quantity"],
        packageId: json["PackageId"],
        modelType: json["ModelType"],
        boxDescription: json["BoxDescription"],
        paletteFz: json["PaletteFz"],
      );
}
