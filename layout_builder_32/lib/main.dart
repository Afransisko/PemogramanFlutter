import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Builder'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // Bagian atas (warna biru) dengan tiga kotak oranye di dalamnya
          Container(
            color: Colors.blue,
            height: 200, // Atur tinggi sesuai kebutuhan
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: constraints.maxWidth / 4,
                        height: 100, // Atur tinggi sesuai kebutuhan
                        color: Colors.orange,
                      ),
                      Container(
                        width: constraints.maxWidth / 4,
                        height: 100, // Atur tinggi sesuai kebutuhan
                        color: Colors.orange,
                      ),
                      Container(
                        width: constraints.maxWidth / 4,
                        height: 100, // Atur tinggi sesuai kebutuhan
                        color: Colors.orange,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Bagian bawah (warna abu-abu) dengan teks
        ],
      ),
    );
  }
}
