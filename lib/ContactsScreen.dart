import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/ConatactManager.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  ConatactManager manager = new ConatactManager();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            Chip(label: StreamBuilder<int>(
              stream: manager.contactCounter,
              builder: (context, snapshot) {
                return Text((snapshot.data ?? 0).toString(), 
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                );
              }
            ),
              backgroundColor: Colors.orange,
            ),
            Padding(padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),

        body: StreamBuilder <List<String>> (
          stream: manager.contactListNow,
          builder: (context, snapshot) {
            List<String> contacts = snapshot.data;
            return ListView.separated(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(contacts[index]),);
              }, 
              separatorBuilder: (context, index) => Divider(),
            ); 
              
          }
        ),
      ), length: 2,
    );
  }
}