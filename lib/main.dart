import 'package:emailapp/App.dart';
//import 'package:emailapp/MessageList.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         //primarySwatch: Colors.lightBlue,
         /*accentColor: Colors.orangeAccent,*/
         //brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[800],
        accentColor: Colors.blue[300],
      ),
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
