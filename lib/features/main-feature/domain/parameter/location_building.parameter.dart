class LocationBuildingParameter {
  final int? start;
  final int? length;

  const LocationBuildingParameter({
    this.length,
    this.start,
  });

  Map<String, dynamic> toJson() => {
        'start': start,
        'length': length,
      };
}
