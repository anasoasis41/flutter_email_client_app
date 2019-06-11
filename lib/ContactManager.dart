import 'dart:async';

import 'package:flutter_email_client_app/model/Contact.dart';
import 'package:flutter_email_client_app/service/ContatctService.dart';


class ContactManager {

  final StreamController<int> _contactCounter = StreamController<int>();
  Stream<int> get contactCounter => _contactCounter.stream;


  Stream<List<Contact>> get contactListView async* {
    yield await ContactService.browse();
  }


  ContactManager() {
    contactListView.listen((list) => _contactCounter.add(list.length));
  }
}