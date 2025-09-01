class SubmitMovingBoxParams {
  final String? id;
  final String? idLocationSection;

  const SubmitMovingBoxParams({
    this.id,
    this.idLocationSection,
  });

  Map<String, dynamic> toJson() => {
        'Id': id,
        'IdLocationSection': idLocationSection,
      };
}
