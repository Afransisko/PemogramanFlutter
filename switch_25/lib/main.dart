import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    ); // MaterialApp
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool statusSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //height: 100,
              //width: 100,
              color: Colors.grey,
              child: Switch(
                activeColor: Colors.amber,
                inactiveTrackColor: Colors.red,
                activeTrackColor: Colors.green,
                inactiveThumbColor: Colors.indigo,
                activeThumbImage: AssetImage("images/1.jpeg"),
                inactiveThumbImage: AssetImage("images/2.jpeg"),
                value: statusSwitch,
                onChanged: (value) {
                  setState(() {
                    statusSwitch = !statusSwitch;
                  });
                  print(statusSwitch);
                },
              ),
            ), // Switch
            Text(
              (statusSwitch == true) ? "Switch On" : "Switch Off",
              style: TextStyle(
                fontSize: 35,
              ), // TextStyle
            ) // Text
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}
