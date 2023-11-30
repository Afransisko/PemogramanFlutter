import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> myList = [
    {
      "Name": "ABDULLAH ADAM",
      "Age": 20,
      "favcolor": ["pink", "blue", "white", "green", "yellow", "dark"],
    },
    {
      "Name": "Paulositanggang",
      "Age": 24,
      "favcolor": ["blue", "red", "green", "dark"],
    },
    {
      "Name": "Balotelli",
      "Age": 445,
      "favcolor": ["Black", "balck", "blue", "orange"]
    },
    {
      "Name": "messi",
      "Age": 27,
      "favcolor": ["pink", "yellow", "white", "brown", "pink", "coksu"],
    },
    {
      "Name": "Asep",
      "Age": 30,
      "favcolor": ["white", "blue", "red", "blue"]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ID Apps"),
        ),
        body: ListView(
          children: myList.map((data) {
            print(data["favcolor"]);
            List myfavcolor = data["favcolor"];
            print("----------");
            print(myfavcolor);
            return Card(
              margin: EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.1),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //row
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${data['Name']}"),
                            Text("Age : ${data['Age']}"),
                          ],
                        ),
                      ],
                    ),
                    //favcolor
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: myfavcolor.map((Color) {
                          return Container(
                            color: Colors.yellow,
                            margin: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 8,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(Color),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
