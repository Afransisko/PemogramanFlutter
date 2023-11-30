import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List Tile"),
        ),
        body: ListView(
          children: [
            ListTile(
              // contentPadding: EdgeInsets.all(10),// jarak konten dengan batas atas bawah kiri dan kanan
              // contentPadding: EdgeInsets.only(top: 50), // jarak konten batas atas
              contentPadding: EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 10), //jarak konten batas atas dan bawah
              title: Text("ABDULLAH ADAM"),
              subtitle: Text(
                "this is subtitle",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              leading: CircleAvatar(),
              trailing: Text("10:00 PM"),
              //tileColor: Colors.amber,
              // dense: true,
              // onTap: (){
              //   return;
              // },
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("ABDULLAH ADAM"),
              subtitle: Text("this is subtitle,"),
              leading: CircleAvatar(),
              trailing: Text("10:00 PM"),
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text("ABDULLAH ADAM"),
              subtitle: Text("this is subtitle,"),
              leading: CircleAvatar(),
              trailing: Text("10:00 PM"),
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text("ABDULLAH ADAM"),
              subtitle: Text("this is subtitle,"),
              leading: CircleAvatar(),
              trailing: Text("10:00 PM"),
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text("ABDULLAH ADAM"),
              subtitle: Text("this is subtitle,"),
              leading: CircleAvatar(),
              trailing: Text("10:00 PM"),
            ),
          ],
        ),
      ),
    );
  }
}
