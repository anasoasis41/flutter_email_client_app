import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/App.dart';
import 'package:flutter_email_client_app/manager/ContactManager.dart';
import 'package:flutter_email_client_app/Provider.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ContactManager>(
      data: ContactManager(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo, accentColor: Colors.indigoAccent
        ),
        home: App(),
      ),
    );
  }
}


















