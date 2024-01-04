import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  static const nameRoute = '/photopage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Page"),
      ),
      body: Center(
        child: Text(
          "PHOTO PAGE",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
