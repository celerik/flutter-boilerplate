import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_boilerplate/business_logic/services/api_calls/todo_api.dart';
import 'package:flutter_boilerplate/business_logic/services/models/todolist.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

part 'to_do_list_event.dart';
part 'to_do_list_state.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  TodoApi todo = new TodoApi();
  ToDoListBloc() : super(ToDoListInitial());
  final _todoFetcher = PublishSubject<List<TodoList>>();

  Stream<List<TodoList>> get todoListStream => _todoFetcher.stream;

  Future<List<TodoList>> fetchTodo() async {
    List<TodoList> toDo;
    toDo = await todo.getTodoList();
    _todoFetcher.sink.add(toDo);
    return toDo;
  }

  @override
  Stream<ToDoListState> mapEventToState(
    ToDoListEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
