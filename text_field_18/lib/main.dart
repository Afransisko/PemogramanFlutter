import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController myController = TextEditingController();

  String hasil = "HASIL INPUTAN";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Field"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: myController,
                    // text: "Initial"
                    onChanged: (value){
                      print("ONCHANGE");
                      
                    },
                    onSubmitted: (value){
                      print(value);
                      setState(() {
                        hasil = value;
                      });
                    },
                    onEditingComplete: (){
                      print("EDIT SUKSES");
                      print(myController.text);
                    },
                ),
                Text(hasil),
              ],
            ),
          ),
        ),
      ),
    );
  }
}