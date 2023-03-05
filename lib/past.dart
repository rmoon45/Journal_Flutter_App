import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class MyPastPage extends StatefulWidget {
  const MyPastPage({super.key});


  @override
  State<MyPastPage> createState() => _MyPastPageState();
}

class _MyPastPageState extends State<MyPastPage> {

  Query dbRef = FirebaseDatabase.instance.ref().child('entries');

  Widget listItem({required Map item}) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['title'],
              style: const TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              item['entry'],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                item['date'],
              ),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Past Entries'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              //get snapshot as map
              Map item = snapshot.value as Map;

              item['key'] = snapshot.key;

              return listItem(item: item);
            },
          ),
        )
    );
  }
}

