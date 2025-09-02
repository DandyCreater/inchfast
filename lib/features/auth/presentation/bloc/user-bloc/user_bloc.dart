import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/login.entity.dart';
import '../../../domain/usecase/clear_user_data.usecase.dart';
import '../../../domain/usecase/user.usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase _userUseCase;
  final ClearUserDataUseCase _clearUserDataUseCase;
  UserBloc(
    this._clearUserDataUseCase,
    this._userUseCase,
  ) : super(UserInitial()) {
    on<LoadUserData>((event, emit) async {
      emit(UserLoading());
      final result = await _userUseCase();
      if (result != null) {
        emit(UserSuccess(
          result,
        ));
      } else {
        emit(
          UserFailed(),
        );
      }
    });

    on<ClearUserData>((event, emit) async {
      await _clearUserDataUseCase();
    });
  }
}
