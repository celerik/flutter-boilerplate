import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_boilerplate/business_logic/services/api_calls/todo_api.dart';
import 'package:flutter_boilerplate/business_logic/services/models/todolist.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

part 'to_do_list_event.dart';
part 'to_do_list_state.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc() : super(ToDoListState());

  @override
  Stream<ToDoListState> mapEventToState(
    ToDoListEvent event,
  ) async* {
    if (event is FetchAll) {
      yield ToDoListState();
    }
    // TODO: implement mapEventToState
  }
}
