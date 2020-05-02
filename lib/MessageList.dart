
import 'package:emailapp/ComposeButton.dart';
//import 'package:emailapp/ComposeMessage.dart';
import 'package:emailapp/Message.dart';
import 'package:emailapp/MessageDetail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter/material.dart';


class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _MessageListState();

}
class _MessageListState extends State<MessageList> {
  Future <List<Message>> future;
  List <Message> messages;

  void initState() {
    super.initState();
    fetch();
  }

  void fetch () async {
    future = Message.browse();
    messages = await future;
  }

  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), 
            onPressed: () async{
              setState(() {
                future = Message.browse();
              });

            },)
          ],
        ),
        drawer: Drawer(
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
        ),
        body: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if(snapshot.hasError) 
                  return Text("There was an error: ${snapshot.error}");
                var messages = snapshot.data;
                return ListView.separated(
                  itemCount: messages.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index){
                    Message message = messages[index];

                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Archive',
                          color: Colors.blue,
                          icon: Icons.archive,
                          onTap: () {},
                        ),
                        IconSlideAction(
                          caption: 'Share',
                          color: Colors.indigo,
                          icon: Icons.share,
                          onTap: () {},
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'More',
                          color: Colors.black45,
                          icon: Icons.more_horiz,
                          onTap: () {},
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            setState(() {
                              messages.removeAt(index);
                            });
                          },
                        ),
                      ],

                      child: ListTile(
                        title: Text(message.subject),
                        isThreeLine: true,
                        leading: CircleAvatar(
                          child: Text('Mam')
                          
                        ),
                        subtitle: Text(
                          message.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (BuildContext context) =>
                                MessageDetail(message.subject, message.body),
                            ),
                          );
                        },
                      ), key: ObjectKey(message),
                     
                    );
                  },
                );
  
            }

          },

        ),
        floatingActionButton: ComposeButton(messages),
      );
  }
}
