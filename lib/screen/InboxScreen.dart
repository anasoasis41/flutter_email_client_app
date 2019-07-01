import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/AppDrawer.dart';
import 'package:flutter_email_client_app/ComposeButton.dart';
import 'package:flutter_email_client_app/MessageList.dart';


class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inbox"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                }),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Important"),
              Tab(text: "Other"),
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
            children: <Widget>[
              MessageList(status: 'important'),
              MessageList(status: 'other'),
            ]
        ),
        floatingActionButton: ComposeButton([]),
      ),
      length: 2,
    );
  }
}
