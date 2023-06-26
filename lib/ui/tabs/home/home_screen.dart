import 'package:flutter/material.dart';
import 'package:n8_default_project/data/local/db/local_database.dart';
import 'package:n8_default_project/models/todo_model_for_sql/todo_model_sql.dart';
import 'package:n8_default_project/ui/tabs/home/widgets/todo_item_view.dart';
import 'package:n8_default_project/utils/ui_itils.dart';

import '../../../models/todo_model/todo_category.dart';
import '../../../models/todo_model/todo_model.dart';
import '../../../models/todo_model/todo_status.dart';
import '../../../utils/icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.toDos,
    required this.onSomethingChanged,
  }) : super(key: key);

  final List<ToDoModel> toDos;
  final VoidCallback onSomethingChanged;

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
              onSelect: () {
                LocalDatabase.updateToDoStatus(
                  id: toDoModel.id,
                  statusIndex: 0,
                );
               widget.onSomethingChanged.call();
              },
              onCancelTap: () {
                LocalDatabase.updateToDoStatus(
                  id: toDoModel.id,
                  statusIndex: 2,
                );
                widget.onSomethingChanged.call();
              },
            );
          }),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
