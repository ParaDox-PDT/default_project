import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/tabs/home/widgets/todo_item_view.dart';

import '../../../models/todo_category.dart';
import '../../../models/todo_model.dart';
import '../../../models/todo_status.dart';
import '../../../utils/icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoModel> toDos = [
    ToDoModel(
      expiredDate: "2023-08-23 19:30",
      description: "Desc",
      title: "Fitnesga borishim kk",
      createdAt: "",
      category: ToDoCategory(
        id: 1,
        categoryName: "Sport",
        iconPath: AppImages.sport,
        colorInString: "FF8080",
      ),
      status: ToDoStatus.inProgress,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do List")),
      body: ListView(
        children: [
          ...List.generate(toDos.length, (index) {
            ToDoModel toDoModel = toDos[index];
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
