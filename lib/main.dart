import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/Bloc/todo_bloc.dart';
import 'package:todo_firestore/Repository/todo_repository.dart';
import 'package:todo_firestore/Ui/empty_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_firestore/Ui/home_screen.dart';

import 'Bloc/simple_bloc_observer.dart';
import 'Utilities/utilities.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider<TodoBloc>(
      create: (BuildContext context) =>
          TodoBloc(repository: TodoRepository())..add(FetchAllTodo()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BlocBuilder<TodoBloc, TodoState>(
        builder: (BuildContext context, state) {
          if (state is TodoLoadedState) {
            return state.todos.isEmpty ? EmptyScreen() : HomeScreen();
          } else if (state is TodoErrorState) {
            Utilities.showToast(state.message);
          }

          return Container();
        },
      ),
    );
  }
}
