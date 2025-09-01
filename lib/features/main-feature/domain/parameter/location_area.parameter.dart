class LocationAreaParameter {
  final int? start;
  final int? length;
  final String? idBuilding;

  const LocationAreaParameter({
    this.idBuilding,
    this.length,
    this.start,
  });

  Map<String, dynamic> toJson() => {
        'start': start,
        'length': length,
        'id_building': idBuilding,
      };
}
