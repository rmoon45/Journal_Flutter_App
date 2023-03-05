// import 'package:flutter/material.dart';
// import 'today.dart';
// import 'entry.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class MyPastPage extends StatefulWidget {
//   const MyPastPage({super.key});
//
//
//   @override
//   State<MyPastPage> createState() => _MyPastPageState();
// }
//
// class _MyPastPageState extends State<MyPastPage> {
//
//   var entryList = [];
//
//   _MyPastPageState() {
//
//     //go to the entries path, and load it all at once; data snapshot
//     FirebaseDatabase.instance.ref().child("entries").once()
//         .then((data) {
//           var temp = [];
//           (data.snapshot.value!['myList'] as List).forEach((k, v) {
//
//             temp.add(v);
//           });
//           entryList = temp;
//
//     });
//     }
//   };
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text('Past Entries'),
//       ),
//       body: ListView.builder(
//         itemCount: entryList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile (
//             onPressed: () {
//               print("Item is clicked" + index.toString());
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => const MyEntryPage(entryList[index]),
//                 ),
//               );
//             },
//             title: Text('${entryList[index].title}'),
//             subtitle: Text('$entryList[index'),
//
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => const MyTodayPage(),
//             ),
//           );
//         },
//         tooltip: 'New Entry',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
