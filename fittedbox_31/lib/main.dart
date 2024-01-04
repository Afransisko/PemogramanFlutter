import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitted Box"),
        ),
        body: Center(
          child: Container(
            color: Colors.blue,
            width: 300,
            height: 100,
            // child: Center(
              child: FittedBox(
              // child: Text(
              //   "Halooooooooooooooooooooooooooooooooooooooo",
              //   style: TextStyle(
              //     fontSize: 35,
              //     color: Colors.white,
              //   ),
              //   ),
              alignment: Alignment.centerRight,
              fit: BoxFit.fill,
              child: Image.network("https://picsum.photos/200/300"),
                )
            ),
          // )
          ),
      ),
    );
  }
}