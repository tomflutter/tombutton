import 'package:flutter/material.dart';
import 'package:tombutton/models/TombButtonModel.dart';
import 'package:tombutton/tombutton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TombButton")),
        body: Center(
            child: TombButton(
          model: TombButtonModel(
            text: 'Tombol Canggih',
            backgroundColor: Colors.blue,
            fontSize: 18.0,
            width: 200.0,
            height: 60.0,
            onPressed: () {
              print('Tombol Ditekan!');
            },
          ),
        )),
      ),
    );
  }
}
