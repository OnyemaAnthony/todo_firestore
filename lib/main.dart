import 'package:flutter/material.dart';
import 'package:todo_firestore/Ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),

    );
  }
}

