import 'package:flutter/material.dart';

Color teal = Color.fromRGBO(45, 161, 137, 1);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/profile.jpeg'),
              ),
              Text(
                "Prathamesh Mutkure",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pacifico",
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                    color: Colors.teal[100],
                    fontFamily: "Source Sans Pro",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 20,
                width: 170,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: teal,
                  ),
                  title: Text(
                    "+91 1234 567 890",
                    style: TextStyle(
                        fontSize: 20,
                        color: teal,
                        fontFamily: "Source Sans Pro"),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: teal,
                  ),
                  title: Text(
                    "prathamesh@apple.com",
                    style: TextStyle(
                        fontFamily: "Source Sans Pro",
                        fontSize: 20,
                        color: teal),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
