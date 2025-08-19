part of 'unloading_bloc.dart';

class UnloadingEvent extends Equatable {
  const UnloadingEvent();

  @override
  List<Object> get props => [];
}

class SearchUnloading extends UnloadingEvent {
  final String? params;

  const SearchUnloading({this.params});

  @override
  // TODO: implement props
  List<Object> get props => [
        params!,
      ];
}
