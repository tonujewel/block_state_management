import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/models/task.dart';
import 'package:bloc_state_management/services/todo_service.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _todoService;
  TodoBloc(this._todoService) : super(TodoInitial()) {
    on<LoadTodoEvent>((event, emit) {
      final todos = _todoService.getTasks(event.username);

      emit(TodoLoadedState(todos, event.username));
    });

    on<AddTodoEvent>((event, emit) {
      final currentState = state as TodoLoadedState;

      _todoService.addTask(currentState.username, event.todoText);
      add(LoadTodoEvent(currentState.username));
    });

    on<TodoToggleEvent>((event, emit) async {
      final currentState = state as TodoLoadedState;
      await _todoService.updateTask(event.todoTask, currentState.username);
      add(LoadTodoEvent(currentState.username));
    });
  }
}
