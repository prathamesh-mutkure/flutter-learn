import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: Text("I Am Poor"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Image(
            image: AssetImage("images/corona.png"),
          ),
        ),
      ),
    ),
  );
}
