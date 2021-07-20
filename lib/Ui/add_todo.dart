import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/Bloc/todo_bloc.dart';
import 'package:todo_firestore/Repository/todo_repository.dart';
import 'package:todo_firestore/Ui/home_screen.dart';
import 'package:todo_firestore/Utilities/utilities.dart';
import 'package:todo_firestore/model/TodoModel.dart';

// ignore: must_be_immutable
class AddTodoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
 final TextEditingController titleController = TextEditingController();
final  TextEditingController descriptionController = TextEditingController();
  late TodoBloc todoBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoBloc(repository: TodoRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add todo'),
          centerTitle: true,
        ),
        body: Builder(
          builder: (BuildContext context) {
            todoBloc = BlocProvider.of<TodoBloc>(context);
            return BlocConsumer<TodoBloc, TodoState>(
              listener: (context,state){
                if(state is TodoAddedState){
                  Utilities.pushReplace(context, HomeScreen());
                }
              },
              builder: (context, state) {
                if (state is TodoInitial) {
                  return buildAddTodoForm(context);
                } else if (state is TodoLoadingState) {
                  return Utilities.showProgressIncator();
                } else if (state is TodoErrorState) {
                  Utilities.showToast(state.message);
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildAddTodoForm(BuildContext context) {
    return Column(
      key: _formKey,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          validator: (input) => input!.isEmpty ? 'Please enter a title' : null,
          controller: titleController,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            labelText: 'Enter title',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: (input) =>
              input!.isEmpty ? 'Please enter a description' : null,
          controller: descriptionController,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Enter Description',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            submitTodo(context);
          },
          child: Text(
            'Add Todo',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  void submitTodo(BuildContext context) {
      todoBloc.add(
        SaveTodoEvent(
          TodoModel(
            title: titleController.text,
            description: descriptionController.text,
            updatedAt: DateTime.now(),
            createdAt: DateTime.now(),
          ),
        ),
      );

  }
}
