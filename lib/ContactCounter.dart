import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/Provider.dart';
import 'package:flutter_email_client_app/manager/ContactManager.dart';


class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return StreamBuilder<int>(
        stream: manager.contactCounter,
        builder: (context, snapshot) {
          return Chip(
            label: Text(
              (snapshot.data ?? 0).toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            backgroundColor: Colors.red,
          );
        }
    );
  }
}
