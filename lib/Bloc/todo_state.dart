part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadingState extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoLoadedState extends TodoState {
  late final List<TodoModel> todos;

  TodoLoadedState(this.todos);

  @override
  List<Object?> get props => [];
}

class TodoErrorState extends TodoState {
  final String message;

  TodoErrorState(this.message);

  @override
  List<Object?> get props => [];
}


