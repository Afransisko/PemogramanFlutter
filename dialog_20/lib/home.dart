import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "Belum Ada Input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Text(
          data, 
          style: TextStyle(
            fontSize: 36,
          ) ,
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Telah di Klik");
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                title: Text("CONFIRM"),
                content: Text("Are you sure to delete this item ? "),
                actions: [
                  TextButton(    //RaisedButton itu bisa juga menggunakan Elevatedbutton
                    onPressed: () {
                      print("Klik No");
                      setState(() {
                        data = "FALSE";
                      });
                      Navigator.of(context).pop(false);
                    }, 
                    child: Text("NO"),
                    ),
                  TextButton(   //flatButton itu bisa juga menggunakan TextButton
                    onPressed: () {
                      print("Klik Yes");
                      setState(() {
                        data = "TRUE";
                      });
                      Navigator.of(context).pop(true);
                    }, 
                    child: Text("YES"),
                    ),
                ],
              );
            },
            // ).then((value) => print(value));
          ).then((value){
            return print(value);
          });
        },
        child: Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}