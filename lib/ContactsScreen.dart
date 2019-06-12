import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/AppDrawer.dart';
import 'package:flutter_email_client_app/ContactCounter.dart';
import 'package:flutter_email_client_app/ContactListBuilder.dart';
import 'package:flutter_email_client_app/ContactSearch.dart';
import 'package:flutter_email_client_app/model/Contact.dart';

class ContactsScreen extends StatelessWidget {
  //ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            ContactCounter(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: ContactSearch()
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ContactListBuilder(
          builder: (context, contacts) {
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
        )
      ),
      length: 2,
    );
  }
}
