// ignore_for_file: unused_import, file_names, unnecessary_new

import 'package:flutter_dictionary_app/conversations/conversations-list.dart';

class Conversation {
  int id;
  String content;
  String name;
  String image;
  String audio;
  Conversation(
      {required this.id,
      required this.name,
      required this.content,
      required this.image,
      required this.audio});

  factory Conversation.fromJson(Map<String, dynamic> res) {
    return new Conversation(
      id: res['id'],
      name: res['name'],
      content: res['content'],
      image: res['image'],
      audio: res['audio'],
    );
  }
}
