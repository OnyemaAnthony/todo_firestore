import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_firestore/Ui/add_todo.dart';
import 'package:todo_firestore/Utilities/utilities.dart';

class EmptyScreen extends StatefulWidget {
  @override
  _EmptyScreenState createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your todo items'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,

        onPressed: () {
         Utilities.pushReplace(context,AddTodoScreen());
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 600,
                width: 300,
                child: SvgPicture.asset('assets/images/empty.svg'),
              ),
              // SizedBox(height: 10,),

             // Text('Your Todo is empty click on the Button to add new Todo')
            ],
          ),
        ),
      ),
    );
  }
}
