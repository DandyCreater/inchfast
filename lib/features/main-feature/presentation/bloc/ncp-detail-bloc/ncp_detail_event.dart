part of 'ncp_detail_bloc.dart';

class NcpDetailEvent extends Equatable {
  const NcpDetailEvent();

  @override
  List<Object> get props => [];
}

class FilterNcpNumber extends NcpDetailEvent {
  final String? lotData;
  final NcpPartNumberEntity? loadData;

  const FilterNcpNumber(
    this.lotData,
    this.loadData,
  );
  @override
  // TODO: implement props
  List<Object> get props => [
        lotData!,
        loadData!,
      ];
}
