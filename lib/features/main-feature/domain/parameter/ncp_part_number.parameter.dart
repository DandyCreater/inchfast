class NcpPartNumberParameter {
  final String? packingMonth;
  final String? idVehicle;
  final String? searchValue;

  const NcpPartNumberParameter({
    this.idVehicle,
    this.packingMonth,
    this.searchValue,
  });

  Map<String, dynamic> toJson() => {
        'id_vehicle': idVehicle,
        'search_filter': 0,
        'search_value': searchValue,
        'length': 30,
      };
}
