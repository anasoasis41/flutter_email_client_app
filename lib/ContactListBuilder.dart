import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/Provider.dart';
import 'package:flutter_email_client_app/manager/ContactManager.dart';
import 'package:flutter_email_client_app/model/Contact.dart';


class ContactListBuilder extends StatelessWidget {

  final Function builder;

  const ContactListBuilder({this.builder});

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);

    return StreamBuilder<List<Contact>> (
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

            return builder(context, contacts);

        }

      },
    );
  }
}
