class CloseUnloadingEntity {
  final int? count;
  final int? filtered;
  final List<ListDataEntity>? listData;
  final int? code;
  final bool? succeeded;
  final String? message;
  final String? description;

  const CloseUnloadingEntity(
      {required this.code,
      required this.count,
      required this.description,
      required this.filtered,
      required this.listData,
      required this.message,
      required this.succeeded});

  factory CloseUnloadingEntity.fromJson(Map<String, dynamic> json) {
    return CloseUnloadingEntity(
      code: json['Code'],
      count: json['Count'],
      description: json['Description'],
      filtered: json['Filtered'],
      listData: json['List'] != null
          ? List<ListDataEntity>.from(
              json["List"].map((x) => ListDataEntity.fromJson(x)))
          : null,
      message: json['Message'],
      succeeded: json['Succeeded'],
    );
  }
}

class ListDataEntity {
  final String? palleteFz;
  final String? fzNoComplete;
  final String? box;
  final int? qty;

  const ListDataEntity({
    required this.box,
    required this.fzNoComplete,
    required this.palleteFz,
    required this.qty,
  });

  factory ListDataEntity.fromJson(Map<String, dynamic> json) {
    return ListDataEntity(
      box: json['Box'],
      fzNoComplete: json['FzNoComplete'],
      palleteFz: json['PalleteFz'],
      qty: json['Quantity'],
    );
  }
}
