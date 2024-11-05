import 'package:flutter/material.dart';
import 'package:tombutton/tombutton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TombButton Example")),
        body: Center(
          child: TombButton(
            text: "Press Me",
            backgroundColor: Colors.green,
            onPressed: () {
              print("Button pressed!");
            },
          ),
        ),
      ),
    );
  }
}
