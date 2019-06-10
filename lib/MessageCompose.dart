import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/Message.dart';


class MessageCompose extends StatefulWidget {

  @override
  _MessageComposeState createState() => _MessageComposeState();
}


class _MessageComposeState extends State<MessageCompose> {

  String to = "";
  String subject = "";
  String body = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Compose New Message"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: TextField(
                onChanged: (value) {
                  to = value;
                },
                decoration: InputDecoration(
                  labelText: 'To',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            ListTile(
              title:  TextField(
                onChanged: (value) {
                  subject = value;
                },
                decoration: InputDecoration(
                  labelText: 'Subject',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            ListTile(
                title: TextField(
                  onChanged: (value) {
                    body = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Body',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  maxLines: 9,
                )
            ),

            ListTile(
              title: RaisedButton(
                  child: Text('SEND'),
                  onPressed: () {
                    Message message = Message(subject, body);
                    Navigator.pop(context, message);
                  }),
            )
          ],
        ),

      ),
    );
  }
}

