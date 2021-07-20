import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/Bloc/todo_bloc.dart';
import 'package:todo_firestore/Repository/todo_repository.dart';
import 'package:todo_firestore/Utilities/utilities.dart';

class AddTodoScreen extends StatelessWidget {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
            return BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoInitial) {
                  return buildAddTodoForm();
                } else if (state is TodoLoadingState) {
                  return Utilities.showLoader('Fetching Todos');
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

  Widget buildAddTodoForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          validator: (input)=> input!.isEmpty? 'Please enter a title':null,
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
          validator: (input)=> input!.isEmpty? 'Please enter a description':null,
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
          onPressed: () {},
          child: Text(
            'Add Todo',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
