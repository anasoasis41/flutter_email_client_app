import 'dart:async';

import 'package:flutter_email_client_app/model/Contact.dart';
import 'package:flutter_email_client_app/service/ContatctService.dart';
import 'package:rxdart/rxdart.dart';


class ContactManager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  // BehaviorSubject(rxdart): listen to data many times
  final BehaviorSubject<int> _countSubject = BehaviorSubject<int>();
  final PublishSubject<List<Contact>> _collectionSubject = PublishSubject();

  // receive data
  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;
  Stream<List<Contact>> get browse$ => _collectionSubject.stream;

  ContactManager() {
    _filterSubject.stream.listen((filter) async {
      var contacts = await ContactService.browse(filter: filter);

      _collectionSubject.add(contacts);
    });
    
    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
    _countSubject.close();
    _filterSubject.close();
  }
}