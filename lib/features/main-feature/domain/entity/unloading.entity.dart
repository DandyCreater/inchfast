class UnloadingEntity {
  DataEntity? data;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  UnloadingEntity({
    required this.data,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory UnloadingEntity.fromJson(Map<String, dynamic> json) =>
      UnloadingEntity(
        data: DataEntity.fromJson(json["Data"]),
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
}

class DataEntity {
  String? model;
  String? shipName;
  String? shipDeparture;
  String? containerNumber;
  String? packingMonth;
  List<DetailBoxEntity>? detailBox;
  LoadingEntity? loading;
  String? id;
  String? type;
  String? description;
  String? box;
  int? quantity;
  String? commnos;
  String? sealNo;
  String? fzNoComplete;

  DataEntity({
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

  factory DataEntity.fromJson(Map<String, dynamic> json) => DataEntity(
        model: json["Model"],
        shipName: json["ShipName"],
        shipDeparture: json["ShipDeparture"],
        containerNumber: json["ContainerNumber"],
        packingMonth: json["PackingMonth"],
        detailBox: (json["DetailBox"]) != null
            ? List<DetailBoxEntity>.from(
                json["DetailBox"].map((x) => DetailBoxEntity.fromJson(x)))
            : null,
        loading: (json["Loading"] != null)
            ? LoadingEntity.fromJson(json["Loading"])
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
}

class DetailBoxEntity {
  String? id;
  String? type;
  String? description;
  String? box;
  int? quantity;
  String? commnos;
  String? sealNo;
  String? fzNoComplete;

  DetailBoxEntity({
    required this.id,
    required this.type,
    required this.description,
    required this.box,
    required this.quantity,
    required this.commnos,
    required this.sealNo,
    required this.fzNoComplete,
  });

  factory DetailBoxEntity.fromJson(Map<String, dynamic> json) =>
      DetailBoxEntity(
        id: json["Id"],
        type: json["Type"],
        description: json["Description"],
        box: json["Box"],
        quantity: json["Quantity"],
        commnos: json["Commnos"],
        sealNo: json["SealNo"],
        fzNoComplete: json["FzNoComplete"],
      );
}

class LoadingEntity {
  String? idLocation;
  String? locationArea;
  String? locationCode;
  String? locationName;
  String? loadingDate;
  int? status;
  String? loadingBy;

  LoadingEntity({
    required this.idLocation,
    required this.locationArea,
    required this.locationCode,
    required this.locationName,
    required this.loadingDate,
    required this.status,
    required this.loadingBy,
  });

  factory LoadingEntity.fromJson(Map<String, dynamic> json) => LoadingEntity(
        idLocation: json["IdLocation"],
        locationArea: json["LocationArea"],
        locationCode: json["LocationCode"],
        locationName: json["LocationName"],
        loadingDate: json["LoadingDate"],
        status: json["Status"],
        loadingBy: json["LoadingBy"],
      );
}
