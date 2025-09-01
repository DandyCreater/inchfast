import '../../domain/entity/moving_box.entity.dart';

class MovingBoxModel {
  Data? data;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  MovingBoxModel({
    required this.data,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory MovingBoxModel.fromJson(Map<String, dynamic> json) => MovingBoxModel(
        data: (json["Data"] != null) ? Data.fromJson(json["Data"]) : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
  MovingBoxEntity toEntity() {
    return MovingBoxEntity(
      data: data?.toEntity(),
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}

class Data {
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
  List<DetailBox>? detailBox;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
            ? List<DetailBox>.from(
                json["DetailBox"].map((x) => DetailBox.fromJson(x)))
            : null,
      );

  DataEntity toEntity() {
    return DataEntity(
      id: id,
      packingMonth: packingMonth,
      idCompany: idCompany,
      shipName: shipName,
      shipDeparture: shipDeparture,
      containerNumber: containerNumber,
      fzNumberComplete: fzNumberComplete,
      fzNumber: fzNumber,
      lot: lot,
      sealNumber: sealNumber,
      size: size,
      box: box,
      modelType: modelType,
      quantity: quantity,
      boxDescription: boxDescription,
      paletteFz: paletteFz,
      locationBuilding: locationBuilding,
      locationArea: locationArea,
      idLocationSection: idLocationSection,
      locationCode: locationCode,
      locationName: locationName,
      detailBox: detailBox?.map((x) => x.toEntity()).toList(),
    );
  }
}

class DetailBox {
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

  DetailBox({
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

  factory DetailBox.fromJson(Map<String, dynamic> json) => DetailBox(
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

  DetailBoxEntity toEntity() {
    return DetailBoxEntity(
      fzNumberComplete: fzNumberComplete,
      fzNumber: fzNumber,
      lot: lot,
      sealNumber: sealNumber,
      size: size,
      quantity: quantity,
      packageId: packageId,
      modelType: modelType,
      boxDescription: boxDescription,
      paletteFz: paletteFz,
    );
  }
}
