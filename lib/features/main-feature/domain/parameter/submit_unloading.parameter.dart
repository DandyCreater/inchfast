class SubmitUnloadingParams {
  String? id;
  String? idLocationSection;
  int? status;

  SubmitUnloadingParams(
    this.id,
    this.idLocationSection,
    this.status,
  );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "IdLocationSection": idLocationSection,
        "Status": status,
      };
}
