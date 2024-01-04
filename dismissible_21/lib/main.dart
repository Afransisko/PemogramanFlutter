import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main(){
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
  final Faker faker = Faker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 100,
        itemBuilder: (context, index){
          return Dismissible(
            //berikut adalah kondisi ketika dia sudah di dismiss
            onDismissed: (direction){
              print("DISMISSED");
              print(direction);
              if(direction == DismissDirection.endToStart){
                print("END TO START");
              }else{
                print("START TO END");
              }
            },
            //untuk konfirmasi
            confirmDismiss: (direction){
              return showDialog(
                context: context, 
              builder: (context){
                return AlertDialog(
                  title: Text("Confirm"),
                  content: Text("Are you sure to delete this item ?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("NO"),
                      ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text("YES"),
                      ),
                  ],
                );
              },);
            },
            key: Key(index.toString()),
            // direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete, size: 25,),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Center(
                  child: Text("${index + 1}"),
                ),
              ),
              title: Text(faker.person.name()),
              subtitle: Text(faker.lorem.sentence()),
            ),
          );
        },
      ),
    );
  }
}