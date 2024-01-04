import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accentColor;

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue, // Atur warna latar belakang AppBar
        hintColor: Colors.red, // Atur warna teks tombol
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Theme App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "This is a text",
                selectionColor: Colors.amber,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                "This is a text",
                selectionColor: Colors.blue,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text("Button with Custom Text Style"),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
