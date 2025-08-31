class AddNcpParameter {
  int? lot;
  String? idVehiclePart;
  String? idShortageProblem;
  String? packingMonth;
  int? quantity;
  String? idNcpFeedbackLocation;
  String? idNcpPartType;
  String? commissionFrom;
  String? commissionTo;
  String? productionNoFrom;
  String? productionNoTo;
  String? es1;
  String? es2;
  String? fzNo;
  String? intColor;
  String? paintColor;
  String? location;
  String? packageIdentification;
  String? prefixNo;

  AddNcpParameter({
    required this.lot,
    required this.idVehiclePart,
    required this.idShortageProblem,
    required this.packingMonth,
    required this.quantity,
    required this.idNcpFeedbackLocation,
    required this.idNcpPartType,
    required this.commissionFrom,
    required this.commissionTo,
    required this.productionNoFrom,
    required this.productionNoTo,
    required this.es1,
    required this.es2,
    required this.fzNo,
    required this.intColor,
    required this.paintColor,
    required this.location,
    required this.packageIdentification,
    required this.prefixNo,
  });

  Map<String, dynamic> toJson() => {
        "Lot": lot,
        "IdVehiclePart": idVehiclePart,
        "IdShortageProblem": idShortageProblem,
        "PackingMonth": packingMonth,
        "Quantity": quantity,
        "IdNcpFeedbackLocation": idNcpFeedbackLocation,
        "IdNcpPartType": idNcpPartType,
        "SingleMultiPart": null,
        "CommissionFrom": commissionFrom,
        "CommissionTo": commissionTo,
        "ProductionNoFrom": productionNoFrom,
        "ProductionNoTo": productionNoTo,
        "Es1": es1,
        "Es2": es2,
        "FzNo": fzNo,
        "IntColor": intColor,
        "PaintColor": paintColor,
        "Location": location,
        "PackageIdentification": packageIdentification,
        "RemarksShortage":
            "Created by the Handheld System, please update the description in InchFast",
        "SaPart": null,
        "Remarks": "Create NCP",
        "PrefixNo": prefixNo,
      };
}
