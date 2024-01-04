import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            color: Colors.blueAccent,
          ),
          leadingWidth: 50,
          title: Container(
            height: 35,
            color: Colors.brown,
          ),
          centerTitle: false,
          actions: [
            Container(
              width: 50,
              color: Colors.green,
              
            ),
            Container(
              width: 50,
              color: Colors.orange,
            )
          ],
          bottom: PreferredSize(preferredSize: Size.fromHeight(200), 
          child: Container(width: 50, height: 200, color: Colors.amber),
           ),
           flexibleSpace: Container(
             width: 50,
             height: 200,
             color: Colors.yellow,
           ),
        ),
      ),
    );
  }
}