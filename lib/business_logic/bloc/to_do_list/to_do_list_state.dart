part of 'to_do_list_bloc.dart';

class ToDoListState {
  TodoApi todo = TodoApi();
  List<TodoList> listTodo = [];
  final _todoFetcher = PublishSubject<List<TodoList>>();
  Stream<List<TodoList>> get todoListStream => _todoFetcher.stream;
  Future<List<TodoList>> fetchTodo() async {
    List<TodoList> todoResponse = await todo.getTodoList();
    listTodo = todoResponse;
    return todoResponse.reversed.toList();
  }

  Future<bool> addTodo(title, description) async {
    bool todoResponse = await todo.addTodoList(title, description);
    if (todoResponse) {
      return true;
    }
    return false;
  }
}
