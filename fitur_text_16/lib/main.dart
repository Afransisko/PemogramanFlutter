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
          title: Text("Fitur Text Field"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              autocorrect: false, //membenarkan typo bahasa inggris
              autofocus: false, //meminta mengisi tanpa di klik
              enableSuggestions: true, ///sama autocorrect, hanya untuk pengguna android
              enableInteractiveSelection: true, //utk paste kalimat yg di copy
              enabled: true, //utk meng on/off
              // obscureText: true, //seperti password bulat2
              obscuringCharacter: '=', //mengganti bulat2 dengan string lain
              keyboardType: TextInputType.number, //untuk nomor saja
              readOnly: true,
            ),
          ),
        ),
      ),
    );
  }
}