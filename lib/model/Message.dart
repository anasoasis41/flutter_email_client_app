import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;


part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  static Future<List<Message>> browse({status = 'important'}) async {
      String url = status == 'important'
          ? "http://www.mocky.io/v2/5cffb0343200003800eac8ec"
          : "http://www.mocky.io/v2/5cfe50d9320000500045effb";

      http.Response response = await http.get(url);

      await Future.delayed(Duration(seconds: 1));

      String content  = response.body;
      // convert String to json
      List collection = json.decode(content);
      List<Message> _messages = collection.map((json) => Message.fromJson(json)).toList();

      return _messages;
  }
}