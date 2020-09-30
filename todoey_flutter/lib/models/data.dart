import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class Data with ChangeNotifier {
  List<Task> _tasks = [
    Task("Task 1"),
    Task("Task 2"),
    Task("Task 3"),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  int get length => _tasks.length;

  void addTask(String text) {
    _tasks.add(Task(text));
    notifyListeners();
  }

  void toggle(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
