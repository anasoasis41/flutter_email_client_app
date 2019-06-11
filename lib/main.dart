import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/App.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo, accentColor: Colors.indigoAccent
      ),
      home: App(),
    );
  }
}


















