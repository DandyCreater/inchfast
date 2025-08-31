part of 'search_moving_box_bloc.dart';

class SearchMovingBoxState extends Equatable {
  const SearchMovingBoxState();

  @override
  List<Object> get props => [];
}

class SearchMovingBoxInitial extends SearchMovingBoxState {}

class SearchMovingBoxLoading extends SearchMovingBoxState {}

class SearchMovingBoxSuccess extends SearchMovingBoxState {
  final MovingBoxEntity? value;

  const SearchMovingBoxSuccess(this.value);

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class SearchMovingBoxFailed extends SearchMovingBoxState {
  final String? msg;

  const SearchMovingBoxFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [
        msg!,
      ];
}
