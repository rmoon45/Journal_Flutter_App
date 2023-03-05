import 'package:flutter/material.dart';
import 'today.dart';
import 'past.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyNavPage extends StatefulWidget {
  const MyNavPage({super.key});

  @override
  State<MyNavPage> createState() => _MyNavPageState();

}

class _MyNavPageState extends State<MyNavPage> {

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    print("Signed user out");
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('My Navigation Page'),
        actions: [
          IconButton(
              onPressed: signUserOut,
              icon: Icon(Icons.logout),
          )
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome \n' + user.email! + '!!\n',
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyTodayPage(),
                  ),
                );
              },
              child: Text(
                  'New Entry for Today',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: Size(150,50),
              ),
            ),

            Text("\n"),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyPastPage(),
                  ),
                );
              },
              child: Text(
                  'Past Entries',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: Size(150,50),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
