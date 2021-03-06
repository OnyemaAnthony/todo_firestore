import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<List<TodoModel>> fetchAllTodo() async {
    QuerySnapshot<Map<String, dynamic>> todoList =
        await FirestoreReference.todoRef.get();
    return todoList.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> todo) =>
            TodoModel.fromFirestore(todo))
        .toList();
  }

  Future<void> updateTodo(TodoModel todoModel, String id) async {
    try {
      await FirestoreReference.todoRef.doc(id).update(todoModel.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteTodo(TodoModel todo, String id) async {
    try {
      await FirestoreReference.todoRef.doc(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
