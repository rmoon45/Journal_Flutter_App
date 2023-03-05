import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyTodayPage extends StatefulWidget {
  const MyTodayPage({super.key});

  @override
  State<MyTodayPage> createState() => _MyTodayPageState();
}

class _MyTodayPageState extends State<MyTodayPage> {

  var titleController = TextEditingController();
  var entryController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    void addEntry() {
      print(titleController.text);
      print(entryController.text);

      var timestamp = new DateTime.now().millisecondsSinceEpoch;

      //locate the database
      FirebaseDatabase.instance.ref().child("entries/entry" + timestamp.toString()).set(
        {
          "title" : titleController.text,
          "entry" : entryController.text,
          "date" : DateTime.now().toString(),
        }
      ).then((value) {
        print("Added new entry!");
      }).catchError((error) {
        print("Failed to add. " + error.toString());
      });

    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          title: Text("Today's Entry"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              obscureText: false,
              maxLength: 20,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),

            //entry itself
            Container(
              margin: EdgeInsets.all(12),
              height: 10 * 24.0,
              child: TextField(
                controller: entryController,
                obscureText: false,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Entry',
              ),
              ),
            ),

            ElevatedButton(
              onPressed: addEntry,
              child: Text('Add Entry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
