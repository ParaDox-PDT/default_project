import 'package:n8_default_project/models/todo_category.dart';
import 'package:n8_default_project/models/todo_importance.dart';
import 'package:n8_default_project/models/todo_status.dart';

class ToDoModel {
  final String title;
  final String description;
  final ToDoCategory category;
  final String createdAt;
  final String expiredDate;
  final ToDoStatus status;
  final ToDoImportance toDoImportance;

  ToDoModel({
    required this.expiredDate,
    required this.description,
    required this.title,
    required this.createdAt,
    required this.category,
    required this.status,
    this.toDoImportance = ToDoImportance.normal,
  });

  ToDoModel copyWith({
    String? title,
    String? description,
    ToDoCategory? category,
    String? createdAt,
    String? expiredDate,
    ToDoStatus? status,
    ToDoImportance? toDoImportance,
  }) {
    return ToDoModel(
      expiredDate: expiredDate ?? this.expiredDate,
      description: description ?? this.description,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      category: category ?? this.category,
      status: status ?? this.status,
      toDoImportance: toDoImportance ?? this.toDoImportance,
    );
  }

  String canAddThis() {
    if (title.isEmpty) return "To Do nomi kiritlimagan";
    if (description.isEmpty) return "Ta'rif kiritilmagan";
    if (category.categoryName.isEmpty) return "Kategoriya tanlang";
    if (expiredDate.isEmpty) return "ToDo muddati xato";
    return "";
  }

  @override
  String toString() {
    return '''
      expiredDate: $expiredDate,
      description: $description 
      title: $title
      createdAt: $createdAt 
      category: $category 
      isDone: $status 
      toDoImportance: $toDoImportance 
    ''';
  }
}
