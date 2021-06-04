import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_auth_state_event.dart';
part 'user_auth_state.dart';

class UserAuthStateBloc extends Bloc<UserAuthStateEvent, UserAuthStateInitial> {
  UserAuthStateBloc() : super(UserAuthStateInitial());

  @override
  Stream<UserAuthStateInitial> mapEventToState(
    UserAuthStateEvent event,
  ) async* {
    if (event is AddUserState) {
      yield UserAuthStateInitial(userName: event.userName!, email: event.email);
    }
  }
}
