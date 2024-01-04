import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Tab> myTab = [
    Tab(
      text: "Tab 1",
      icon: Icon(Icons.add_a_photo),
    ),
    Tab(
      text: "Tab 2",
      icon: Icon(Icons.ac_unit_outlined),
    ),
    Tab(
      text: "Tab 3",

    ),
    // Tab(
    //   child: Text("data"),
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:DefaultTabController(
        initialIndex: 2,
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("MyApps"),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.normal),
              //ini hanya dibawahnya
              /* indicatorColor: Colors.black,
              indicatorWeight: 5,
              indicatorPadding: EdgeInsets.all(10 ), */
              indicator: BoxDecoration(
                color: Colors.pink,
              // borderRadius: BorderRadius.circular(50), //customer castum
              border: Border(
                bottom: BorderSide(
                  //bisa pakai top
                  color: Colors.black,
                  width: 5,
                )
              ),
              ),
              tabs: myTab,
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text(
                  "Tab 1",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Tab 2",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Tab 3",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ],
            ),
        ),
      ),
      
    );
  }
}