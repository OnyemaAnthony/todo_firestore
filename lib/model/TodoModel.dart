import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  late String title;
  late String id;
  late String description;
  late DateTime createdAt;
  late DateTime updatedAt;

  TodoModel({required this.title,
    required this.description,
    required this.updatedAt,
    required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  TodoModel.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>>  todo)
      :  id = todo.id,
        title = todo.data()['title'],
        description = todo.data()['description'],
        createdAt =todo.data()['createdAt'].toDate(),
        updatedAt =todo.data()['updatedAt'].toDate();
}