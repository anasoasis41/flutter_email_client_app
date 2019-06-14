
import 'package:flutter_email_client_app/model/Contact.dart';
import 'package:flutter_email_client_app/service/ContatctService.dart';
import 'package:rxdart/rxdart.dart';


class ContactManager {
  // provide streams to subscribe many times
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  // BehaviorSubject(rxdart): remember the last seen value
  final PublishSubject<int> _countSubject = PublishSubject<int>();
  final PublishSubject<List<Contact>> _collectionSubject = PublishSubject();

  // receive data
  Sink<String> get inFilter => _filterSubject.sink;

  Observable<int> get count$ => _countSubject.stream;
  Observable<List<Contact>> get browse$ => _collectionSubject.stream;

  ContactManager() {
    _filterSubject
        .debounceTime(Duration(milliseconds: 2000))
        .switchMap((filter) async* {
          yield await ContactService.browse(filter: filter);
    }).listen((contacts) async {
      _collectionSubject.add(contacts);
    });

    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
    _countSubject.close();
    _filterSubject.close();
  }
}