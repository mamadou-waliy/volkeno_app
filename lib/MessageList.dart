
import 'package:emailapp/Message.dart';
import 'package:flutter/material.dart';


class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _MessageListState();

}
class _MessageListState extends State<MessageList> {
  Future <List<Message>> messages;
  
  void initState() {
    super.initState();
    messages = Message.browse();
  }

  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: () {
              var _messages = Message.browse();

              setState(() {
                messages = _messages;
              });

            })
          ],
        ),
        body: FutureBuilder(
          future: messages,
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

                    return ListTile(
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
                      
                    );
                  },
                );
  
            }

          },

        )

      );
  }
}