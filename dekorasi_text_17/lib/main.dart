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
          title: Text("Dekorasi Text Field"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            autocorrect: false,
            showCursor: true,
            cursorColor: Colors.grey,
            // cursorHeight: 25,
              // cursorWidth: 10,
              // cursorRadius: Radius.circular(20),
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.none,

              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 20,
              ),
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  size: 35,
                ),
                border: OutlineInputBorder(),

                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                prefixIcon: Icon(Icons.add_a_photo),
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {},
                ),
                //prefixIcon: Icon(
                //Icons.person_add,
                //size: 35,
                //),
                //prefixText: "Name: ",
                hintText: "Please input your name..",
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                ),
                labelText: "Full Name",
                labelStyle: TextStyle(color: Colors.teal),
              ),
            ),
          ),
        ),
    );
  }
}
