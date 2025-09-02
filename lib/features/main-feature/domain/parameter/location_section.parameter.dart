class LocationSectionParameter {
  final String? idArea;
  final int? start;
  final int? length;

  const LocationSectionParameter({
    this.idArea,
    this.length,
    this.start,
  });

  Map<String, dynamic> toJson() => {
        'id_area': idArea,
        'start': start,
        'length': length,
      };
}
