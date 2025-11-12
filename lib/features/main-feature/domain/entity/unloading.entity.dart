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
  LastLocationEntity? lastLocation;
  String? id;
  String? type;
  String? description;
  String? box;
  int? quantity;
  String? commnos;
  String? sealNo;
  String? fzNoComplete;
  bool? esd;
  List<AdditionalInformationEntity>? additionalInformation;

  DataEntity({
    required this.model,
    required this.shipName,
    required this.shipDeparture,
    required this.containerNumber,
    required this.packingMonth,
    required this.detailBox,
    required this.loading,
    required this.lastLocation,
    required this.id,
    required this.type,
    required this.description,
    required this.box,
    required this.quantity,
    required this.commnos,
    required this.sealNo,
    required this.fzNoComplete,
    required this.esd,
    required this.additionalInformation,
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
        lastLocation: (json['LastLocation'] != null)
            ? LastLocationEntity.fromJson(json['LastLocation'])
            : null,
        id: json["Id"],
        type: json["Type"],
        description: json["Description"],
        box: json["Box"],
        quantity: json["Quantity"],
        commnos: json["Commnos"],
        sealNo: json["SealNo"],
        fzNoComplete: json["FzNoComplete"],
        esd: json["ESD"],
        additionalInformation: (json["AdditionalInformation"]) != null
            ? List<AdditionalInformationEntity>.from(
                json["AdditionalInformation"]
                    .map((x) => AdditionalInformationEntity.fromJson(x)))
            : null,
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

class AdditionalInformationEntity {
  final String? typeDocument;
  final String? noDocument;
  final String? validFrom;
  final String? validTo;
  final String? remarks;

  const AdditionalInformationEntity({
    required this.noDocument,
    required this.remarks,
    required this.typeDocument,
    required this.validTo,
    required this.validFrom,
  });

  factory AdditionalInformationEntity.fromJson(Map<String, dynamic> json) {
    return AdditionalInformationEntity(
      noDocument: json['NoDocument'],
      remarks: json['Remarks'],
      typeDocument: json['TypeDocument'],
      validTo: json['ValidTo'],
      validFrom: json['ValidFrom'],
    );
  }
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

class LastLocationEntity {
  final String? idLocation;
  final String? locationArea;
  final String? locationCode;
  final String? locationName;

  const LastLocationEntity(
      {required this.idLocation,
      required this.locationArea,
      required this.locationCode,
      required this.locationName});

  factory LastLocationEntity.fromJson(Map<String, dynamic> json) {
    return LastLocationEntity(
      idLocation: json['IdLocation'],
      locationArea: json['LocationArea'],
      locationCode: json['LocationCode'],
      locationName: json['LocationName'],
    );
  }
}
