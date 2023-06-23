import 'package:flutter/material.dart';

import '../../models/todo_model.dart';

class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({Key? key}) : super(key: key);

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  List<ToDoModel> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
