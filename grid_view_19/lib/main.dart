import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Container> myList = List.generate(90, 
  (index) {
    return Container(
      height: 50,
      width: 150,
      color: Color.fromARGB(
        255, 
        Random().nextInt(256), 
        Random().nextInt(256), 
        Random().nextInt(256)),
    );
  },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid View"),
        ),
        // body: GridView(
        //   padding: EdgeInsets.all(10),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //     childAspectRatio: 4/3, //bisa dibuat 3/4
        //     ),
        //     children: myList,

        //     ),

        body: GridView.count(
          childAspectRatio: 4/3,
          padding: EdgeInsets.all(10),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: myList,
          ),

        // body: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder),
      ),
    );
  }
}