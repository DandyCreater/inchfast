import '../../domain/entity/unloading.entity.dart';

class UnloadingModel {
  Data? data;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  UnloadingModel({
    required this.data,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory UnloadingModel.fromJson(Map<String, dynamic> json) => UnloadingModel(
        data: (json["Data"] != null) ? Data.fromJson(json["Data"]) : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );

  UnloadingEntity toEntity() {
    return UnloadingEntity(
      data: data?.toEntity(),
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}

class Data {
  String? model;
  String? shipName;
  String? shipDeparture;
  String? containerNumber;
  String? packingMonth;
  List<DetailBox>? detailBox;
  Loading? loading;
  String? id;
  String? type;
  String? description;
  String? box;
  int? quantity;
  String? commnos;
  String? sealNo;
  String? fzNoComplete;

  Data({
    required this.model,
    required this.shipName,
    required this.shipDeparture,
    required this.containerNumber,
    required this.packingMonth,
    required this.detailBox,
    required this.loading,
    required this.id,
    required this.type,
    required this.description,
    required this.box,
    required this.quantity,
    required this.commnos,
    required this.sealNo,
    required this.fzNoComplete,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        model: json["Model"],
        shipName: json["ShipName"],
        shipDeparture: json["ShipDeparture"],
        containerNumber: json["ContainerNumber"],
        packingMonth: json["PackingMonth"],
        detailBox: (json["DetailBox"]) != null
            ? List<DetailBox>.from(
                json["DetailBox"].map((x) => DetailBox.fromJson(x)))
            : null,
        loading: (json["Loading"] != null)
            ? Loading.fromJson(json["Loading"])
            : null,
        id: json["Id"],
        type: json["Type"],
        description: json["Description"],
        box: json["Box"],
        quantity: json["Quantity"],
        commnos: json["Commnos"],
        sealNo: json["SealNo"],
        fzNoComplete: json["FzNoComplete"],
      );

  DataEntity toEntity() {
    return DataEntity(
      model: model,
      shipName: shipName,
      shipDeparture: shipDeparture,
      containerNumber: containerNumber,
      packingMonth: packingMonth,
      detailBox: detailBox?.map((x) => x.toEntity()).toList(),
      loading: loading?.toEntity(),
      id: id,
      type: type,
      description: description,
      box: box,
      quantity: quantity,
      commnos: commnos,
      sealNo: sealNo,
      fzNoComplete: fzNoComplete,
    );
  }
}

class DetailBox {
  String? id;
  String? type;
  String? description;
  String? box;
  int? quantity;
  String? commnos;
  String? sealNo;
  String? fzNoComplete;

  DetailBox({
    required this.id,
    required this.type,
    required this.description,
    required this.box,
    required this.quantity,
    required this.commnos,
    required this.sealNo,
    required this.fzNoComplete,
  });

  factory DetailBox.fromJson(Map<String, dynamic> json) => DetailBox(
        id: json["Id"],
        type: json["Type"],
        description: json["Description"],
        box: json["Box"],
        quantity: json["Quantity"],
        commnos: json["Commnos"],
        sealNo: json["SealNo"],
        fzNoComplete: json["FzNoComplete"],
      );
  DetailBoxEntity toEntity() {
    return DetailBoxEntity(
      id: id,
      type: type,
      description: description,
      box: box,
      quantity: quantity,
      commnos: commnos,
      sealNo: sealNo,
      fzNoComplete: fzNoComplete,
    );
  }
}

class Loading {
  String? idLocation;
  String? locationArea;
  String? locationCode;
  String? locationName;
  String? loadingDate;
  int? status;
  String? loadingBy;

  Loading({
    required this.idLocation,
    required this.locationArea,
    required this.locationCode,
    required this.locationName,
    required this.loadingDate,
    required this.status,
    required this.loadingBy,
  });

  factory Loading.fromJson(Map<String, dynamic> json) => Loading(
        idLocation: json["IdLocation"],
        locationArea: json["LocationArea"],
        locationCode: json["LocationCode"],
        locationName: json["LocationName"],
        loadingDate: json["LoadingDate"],
        status: json["Status"],
        loadingBy: json["LoadingBy"],
      );
  LoadingEntity toEntity() {
    return LoadingEntity(
      idLocation: idLocation,
      locationArea: locationArea,
      locationCode: locationCode,
      locationName: locationName,
      loadingDate: loadingDate,
      status: status,
      loadingBy: loadingBy,
    );
  }
}
