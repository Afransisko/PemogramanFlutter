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
          title: Text("Image Widget"),
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 500,
            color: Colors.amber,
            child: Image.asset(
              "images/snak4.jpeg",
            ),
            // child: Image(
            //   // fit: BoxFit.contain,
            //      fit: BoxFit.cover,
            //     //  fit: BoxFit.fill,
            //   image: AssetImage("images/asrivo.jpg"),
            // image: NetworkImage("https://picsum.photos/id/1/200/300"),
          ),
        ),
      ),
    );
  }
}
