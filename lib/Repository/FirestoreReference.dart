

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreReference{

  static final todoRef = FirebaseFirestore.instance.collection('todos');
}