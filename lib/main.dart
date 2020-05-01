import 'package:emailapp/MessageList.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         /*primarySwatch: Colors.lightBlue,
         accentColor: Colors.orangeAccent,*/
         //brightness: Brightness.light,
        primaryColor: Colors.lightBlue[900],
        accentColor: Colors.tealAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: MessageList(title: 'Home'),
    );
  }
}
