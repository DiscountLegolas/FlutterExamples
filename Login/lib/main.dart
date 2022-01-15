import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class User{
  String username;
  String password;
  User({required this.username,required this.password});
}



var users=<User>[];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoggedOnPage extends StatelessWidget{
  LoggedOnPage({Key? key,required this.usr}) : super(key: key);

  User usr;


  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: const Text('Second Page'),automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/4,
              height: MediaQuery.of(context).size.height/4,
              margin: const EdgeInsets.only(bottom: 48.0,top: 50.0),
              decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),fit: BoxFit.scaleDown),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              child: Text.rich(
                TextSpan(
                  text: 'Welcome Abroad ',
                  children: <TextSpan>[TextSpan(text: usr.username,style:const TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white))]
                ),
                style:const TextStyle(fontSize: 50.0,color: Colors.white),
              ),
              margin: const EdgeInsets.only(bottom: 50.0),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width/3,
              child: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',style: TextStyle(height: 1.5,color: Colors.white),),
            )
          ],
        ),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String username="";
  String password="";
  void _Login() {
    User user=User(username: username,password: password);
    users.add(user);
    Navigator.push(context, MaterialPageRoute(builder:(context)=> LoggedOnPage(usr: user,)));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:const Text('Login Page'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2),
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
              onChanged: (String value){username=value;},
              decoration: InputDecoration(
                labelText: 'User Name',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: const BorderSide(color: Colors.green)),
              ),
            ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2),
              child:TextField(
              onChanged: (String value){password=value;},
              decoration: InputDecoration(
                labelText: 'Password',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: const BorderSide(color: Colors.green)),
              ),
            ),
            ),
            Container(padding: const EdgeInsets.only(top: 16.0),child: ElevatedButton(onPressed: _Login, child:const Text('Login')))
          ],
        )
      ),
        
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _OpenNoteTakingPage,
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
