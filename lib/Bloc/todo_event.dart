part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class SaveTodoEvent extends TodoEvent {
  late final TodoModel todoModel;

  SaveTodoEvent(this.todoModel);

  @override
  List<Object?> get props => [];
}

class FetchAllTodo extends TodoEvent {
  @override
  List<Object?> get props => [];
}

