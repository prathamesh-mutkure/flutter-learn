import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/models/data.dart';

final TextEditingController controller = TextEditingController();

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTask;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: kBottomTaskListBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(),
              onChanged: (value) => newTask = value,
            ),
            SizedBox(height: 40),
            FlatButton(
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                controller.clear();
                context.read<Data>().addTask(newTask);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
