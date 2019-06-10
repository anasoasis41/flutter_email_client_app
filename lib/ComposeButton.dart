import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/MessageCompose.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        String intention = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MessageCompose()
            ),
        );

        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Your message has been sent to $intention"),
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }
}
