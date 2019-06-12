import 'dart:async';

import 'package:flutter_email_client_app/model/Contact.dart';
import 'package:flutter_email_client_app/service/ContatctService.dart';
import 'package:rxdart/rxdart.dart';


class ContactManager {

  // BehaviorSubject(rxdart): listen to data many times
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();
  Stream<int> get contactCounter => _contactCounter.stream;


  Stream<List<Contact>> get contactListView =>
      Stream.fromFuture(ContactService.browse());

  Stream<List<Contact>> filteredCollection({query}) =>
      Stream.fromFuture(ContactService.browse(query: query));


  ContactManager() {
    contactListView.listen((list) => _contactCounter.add(list.length));
  }
}