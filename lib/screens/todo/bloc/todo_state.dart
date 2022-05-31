part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoLoadedState extends TodoState {
  final List<Task> todos;
  final String username;

  const TodoLoadedState(this.todos, this.username);
  @override
  List<Object?> get props => [todos,username];
}
