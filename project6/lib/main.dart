import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Column"),
        ),
        body: Stack(
          children: [
            Container(
              width: 400,
              height: 400,
              color: Colors.blue,
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.green,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}