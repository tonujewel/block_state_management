part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class LoadTodoEvent extends TodoEvent {
  final String username;

  const LoadTodoEvent(this.username);

  @override
  List<Object?> get props => [username];
}

class AddTodoEvent extends TodoEvent {
  final String todoText;

  const AddTodoEvent(this.todoText);

  @override
  List<Object?> get props => [todoText];
}

class TodoToggleEvent extends TodoEvent {
  final String todoTask;

  const TodoToggleEvent(this.todoTask);
  @override
  List<Object?> get props => [todoTask];
}
