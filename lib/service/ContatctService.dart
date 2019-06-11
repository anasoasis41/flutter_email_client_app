import 'dart:convert';

import 'package:flutter_email_client_app/model/Contact.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static String _url = "https://jsonplaceholder.typicode.com/users";

  static Future browse() async {
    http.Response response = await http.get(_url);

    await Future.delayed(Duration(seconds: 2));

    String content =  response.body;
    List collection = json.decode(content);
    List<Contact> _contacts = collection.map((json) => Contact.fromJson(json)).toList();
    return _contacts;
  }
}