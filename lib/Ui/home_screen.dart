import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/Bloc/todo_bloc.dart';
import 'package:todo_firestore/Repository/todo_repository.dart';
import 'package:todo_firestore/Ui/add_todo.dart';
import 'package:todo_firestore/Ui/empty_screen.dart';
import 'package:todo_firestore/Utilities/utilities.dart';
import 'package:todo_firestore/model/TodoModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TodoBloc todoBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TodoBloc(repository: TodoRepository())..add(FetchAllTodo()),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          onPressed: () {
            TodoModel todo = TodoModel(
                title: '',
                description: '',
                updatedAt: DateTime.now(),
                createdAt: DateTime.now());

            Utilities.pushReplace(context, AddTodoScreen(todo));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Text('Your todo for today'),
          centerTitle: true,
        ),
        body: Builder(
          builder: (BuildContext context) {
            todoBloc = BlocProvider.of<TodoBloc>(context);
            return BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoInitial) {
                  return Utilities.showLoader("Fetching todoLists", context);
                } else if (state is TodoLoadingState) {
                  return Utilities.showLoader("Fetching todoLists", context);
                } else if (state is TodoLoadedState) {
                  return state.todos.isEmpty? EmptyScreen(): buildTodoList(state.todos);
                } else if (state is TodoErrorState) {
                  return Utilities.showToast(state.message);
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildTodoList(List<TodoModel> todoList) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        TodoModel todo = todoList[index];
        return GestureDetector(
          onTap: () {
            Utilities.pushReplace(context, AddTodoScreen(todo));
          },
          child: ListTile(
            leading: CircleAvatar(
              child: Text(todo.title[0]),
            ),
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: GestureDetector(
              onTap: () {
                todoBloc.add(DeleteTodoEvent(todo.id, todo));
              },
              child: Icon(
                Icons.delete,
              ),
            ),
          ),
        );
      },
    );
  }
}
