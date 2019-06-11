import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/AppDrawer.dart';
import 'package:flutter_email_client_app/ContactManager.dart';
import 'package:flutter_email_client_app/model/Contact.dart';

class ContactsScreen extends StatelessWidget {
  ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            Chip(
              label: StreamBuilder<int>(
                stream: manager.contactCounter,
                builder: (context, snapshot) {
                  return Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  );
                }
              ),
              backgroundColor: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: StreamBuilder (
            stream: manager.contactListView,
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                List<Contact> contacts = snapshot.data;
                return ListView.separated(
                  itemCount: contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Contact _contact = contacts[index];

                    return ListTile(
                      title: Text(_contact.name),
                      subtitle: Text(_contact.email),
                      leading: CircleAvatar(),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
            }

            },
        ),
      ),
      length: 2,
    );
  }
}
