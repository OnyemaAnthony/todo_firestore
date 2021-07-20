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

class UpdateTodoEvent extends TodoEvent{
  final TodoModel todoModel;
  final String id;

  UpdateTodoEvent(this.todoModel,this.id);

  @override

  List<Object?> get props => [];

}