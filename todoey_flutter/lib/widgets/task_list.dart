import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.length,
          itemBuilder: (BuildContext context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              text: task.text,
              isChecked: task.isDone,
              checkboxCallback: (value) => taskData.toggle(index),
              longPressCallback: () {
                taskData.deleteTask(index);
              },
            );
          },
        );
      },
    );
  }
}
