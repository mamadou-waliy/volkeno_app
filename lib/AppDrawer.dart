import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("mwndong95@gmail.com"), 
            accountName: Text("Mamadou Waliy Ndong"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://avatars2.githubusercontent.com/u/43272499?s=460&u=27211042038caf78adbf994aca3685a8378a586b&v=4"),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(title: Text("Add a new account"));
                  });
                },
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
              ),
            
            ],
          ),
            
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text('Inbox'),
            trailing: Chip(
              label: Text("12", style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Colors.grey[400],
            ),
              
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text('Draft'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.archive),
            title: Text('Archive'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.paperPlane),
            title: Text('Sent'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.trash),
            title: Text('Trash'),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.cog),
                title: Text('Settings'),
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}