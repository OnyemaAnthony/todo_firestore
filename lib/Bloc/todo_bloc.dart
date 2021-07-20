import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_firestore/Repository/todo_repository.dart';
import 'package:todo_firestore/model/TodoModel.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoRepository repository;

  TodoBloc({required this.repository}) : super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is SaveTodoEvent) {
      yield* _mapSaveTodoEventToState(event);
    } else if (event is FetchAllTodo) {
      yield* _mapFetchAllTodToState();
    } else if (event is UpdateTodoEvent) {
      yield* _mapUpdateTodoToState(event);
    } else if (event is DeleteTodoEvent) {
      yield* _mapDeleteTodoToState(event);
    }
  }

  Stream<TodoState> _mapSaveTodoEventToState(SaveTodoEvent event) async* {
    yield TodoLoadingState();
    try {
      await repository.saveTodo(event.todoModel);
      yield TodoAddedState();
    } catch (e) {
      yield TodoErrorState(e.toString());
    }
  }

  Stream<TodoState> _mapFetchAllTodToState() async* {
    yield TodoLoadingState();
    try {
      List<TodoModel> todoList = await repository.fetchAllTodo();
      yield TodoLoadedState(todoList);
    } catch (e) {
      yield TodoErrorState(e.toString());
    }
  }

  Stream<TodoState> _mapUpdateTodoToState(UpdateTodoEvent event) async* {
    yield TodoLoadingState();

    try {
      await repository.updateTodo(event.todoModel, event.id);
      yield TodoAddedState();
    } catch (e) {
      yield TodoErrorState(e.toString());
    }
  }

  Stream<TodoState> _mapDeleteTodoToState(DeleteTodoEvent event) async* {
    yield TodoLoadingState();

    try {
      await repository.deleteTodo(event.todoModel, event.id);
    } catch (e) {
      yield TodoErrorState(e.toString());
    }
  }
}
