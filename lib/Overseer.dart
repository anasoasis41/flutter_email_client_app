

import 'package:flutter_email_client_app/manager/ContactManager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  // access from anywhere in application
  fetch(name) => repository[name];
}