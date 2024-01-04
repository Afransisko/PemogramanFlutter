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
    // Mendapatkan informasi ukuran perangkat
    final mediaQuery = MediaQuery.of(context);

    // Mendapatkan tinggi layar perangkat
    final screenHeight = mediaQuery.size.height;
    final orangeContainerHeight =
        screenHeight * 0.3; // Mengurangi tinggi berdasarkan MediaQuery

    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible dan Expanded'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 255, 111, 0),
            height: orangeContainerHeight,
            child: Center(
              child: Text('.'),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              // Menggunakan SingleChildScrollView untuk mengizinkan guliran konten
              child: Container(
                color: Color.fromARGB(255, 241, 246, 249),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('.'),
                      // Daftar item yang bisa digulir
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Item $index'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
