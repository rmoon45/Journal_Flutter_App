import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();


}

class _MyLoginPageState extends State<MyLoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ).then((value) {
      print("Login success");
    }).catchError((error) {
      print("Login failed");
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('My Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Please input email and password for authentication.\n',
            ),

            //textField takes input from user as string
            TextField(

              //email
              obscureText: false,
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: signUserIn,
              child: Text('Submit'),
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
