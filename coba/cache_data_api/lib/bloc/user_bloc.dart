import 'package:bloc/bloc.dart';
import 'package:cache_data_api/api/api_repo.dart';
import 'package:equatable/equatable.dart';

import '../model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  ApiRepository _apiRepository;

  UserBloc(this._apiRepository) : super(UserLoadinState()) {
    on<LoadingUserEvent>((event, emit) async {
      try {
        final users = await _apiRepository.getAllData();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserLoadedError(e.toString()));
      }
    });
  }
}