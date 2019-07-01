import 'package:flutter_email_client_app/manager/ContactManager.dart';
import 'package:flutter_email_client_app/manager/CounterManager.dart';
import 'package:flutter_email_client_app/manager/MessageFormManager.dart';


class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
    register(MessageFormManager, MessageFormManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  // access from anywhere in application
  fetch(name) => repository[name];
}