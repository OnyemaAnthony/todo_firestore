import 'package:todo_firestore/Repository/FirestoreReference.dart';
import 'package:todo_firestore/model/TodoModel.dart';

class TodoRepository {
  Future<void> saveTodo(TodoModel todo) async {
    try {
      await FirestoreReference.todoRef.add(todo.toMap());
    } catch (e) {
      print(e.toString());
    }
  }
}
