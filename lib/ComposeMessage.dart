import 'package:emailapp/Message.dart';
import 'package:flutter/material.dart';

class ComposeMessage extends StatefulWidget {
  @override
  _ComposeMessageState createState() => _ComposeMessageState();
}

class _ComposeMessageState extends State<ComposeMessage> {
  String to = "";
  String subject = "";
  String body = "";

  final Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Message"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: Key,
                  child: Column(
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  validator: (value) => !value.contains('@')
                  ? "'To' field must be a valid email" : null,
                  onSaved: (value) => to = value,
                  decoration: InputDecoration(labelText: 'To', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),

              ListTile(
                title: TextFormField(
                  onSaved: (value) => subject = value,
                  validator: (value) {
                    int len = value.length;
                    if (len == 0) {
                      return "'Subject' field can't be empty";
                    }else if (len < 4) {
                      return "'Subject' must be longer";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Subject', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ), 
              ),
              Divider(),
              ListTile(
                title: TextFormField(

                  onSaved: (value) => body = value,
                  decoration: InputDecoration(labelText: 'Message', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  maxLines: 9,
                ),
              ),
              ListTile(
                title: RaisedButton(
                child: Text('SEND'),
                onPressed: () {

                  if (this.Key.currentState.validate()) {
                    this.Key.currentState.save();
                    Message message = Message(subject, body);
                    Navigator.pop(context, message);
                  }
                  
                  
                  
                },

              ),)
            ],
          ),
        )
        
      )

    );
  }
}