import '../../domain/entity/close_unloading.entity.dart';

class CloseUnloadingModel {
  final int? count;
  final int? filtered;
  final List<ListData>? listData;
  final int? code;
  final bool? succeeded;
  final String? message;
  final String? description;

  const CloseUnloadingModel(
      {required this.code,
      required this.count,
      required this.description,
      required this.filtered,
      required this.listData,
      required this.message,
      required this.succeeded});

  factory CloseUnloadingModel.fromJson(Map<String, dynamic> json) {
    return CloseUnloadingModel(
      code: json['Code'],
      count: json['Count'],
      description: json['Description'],
      filtered: json['Filtered'],
      listData: json['List'] != null
          ? List<ListData>.from(json["List"].map((x) => ListData.fromJson(x)))
          : null,
      message: json['Message'],
      succeeded: json['Succeeded'],
    );
  }

  CloseUnloadingEntity toEntity() {
    return CloseUnloadingEntity(
      code: code,
      count: count,
      description: description,
      filtered: filtered,
      listData: listData?.map((x) => x.toEntity()).toList(),
      message: message,
      succeeded: succeeded,
    );
  }
}

class ListData {
  final String? palleteFz;
  final String? fzNoComplete;
  final String? box;
  final int? qty;

  const ListData({
    required this.box,
    required this.fzNoComplete,
    required this.palleteFz,
    required this.qty,
  });

  factory ListData.fromJson(Map<String, dynamic> json) {
    return ListData(
      box: json['Box'],
      fzNoComplete: json['FzNoComplete'],
      palleteFz: json['PalleteFz'],
      qty: json['Quantity'],
    );
  }

  ListDataEntity toEntity() {
    return ListDataEntity(
      box: box,
      fzNoComplete: fzNoComplete,
      palleteFz: palleteFz,
      qty: qty,
    );
  }
}
