import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/tabs/home/widgets/todo_item_view.dart';

import '../../../models/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.toDos}) : super(key: key);

  final List<ToDoModel> toDos;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do List")),
      body: ListView(
        children: [
          ...List.generate(widget.toDos.length, (index) {
            ToDoModel toDoModel = widget.toDos[index];
            return ToDoItemView(
              toDoModel: toDoModel,
              onSelect: () {},
              onCancelTap: () {},
            );
          })
        ],
      ),
    );
  }
}
