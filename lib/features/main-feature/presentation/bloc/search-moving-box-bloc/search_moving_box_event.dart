part of 'search_moving_box_bloc.dart';

sealed class SearchMovingBoxEvent extends Equatable {
  const SearchMovingBoxEvent();

  @override
  List<Object> get props => [];
}

class SearchMovingBox extends SearchMovingBoxEvent {
  final String? params;

  const SearchMovingBox({required this.params});

  @override
  // TODO: implement props
  List<Object> get props => [params!];
}
