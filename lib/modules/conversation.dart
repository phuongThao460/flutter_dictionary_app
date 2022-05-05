// ignore_for_file: unused_import, file_names, unnecessary_new

import 'package:flutter_dictionary_app/conversations/conversations-list.dart';

class Conversation {
  int id;
  String text;
  String name;
  String image;
  String audio;
  Conversation({required this.id, required this.name, required this.text, required this.image, required this.audio});
  
  factory Conversation.fromJson(Map<String, dynamic> res) {
    return new Conversation(
        id: res['id'],
        name: res['name'],
        text: res['text'],
        image: res['image'],
        audio: res['audio'],
        );
  }

  static List<Conversation> init() {
  List<Conversation> conversationdatadetails = [
  Conversation(
    id: 1,
    name:'introducin yourself',
    text: 'Hit the hay.',
    image: 'assets/conversations/hoi-thoai-tieng-anh.jpg',
    audio: 'assets/audio/00 - Vocabulary.mp3'
  ),
  Conversation(id: 2, name:'introducin yourself', text: 'Stabbed in the back', image: ' ',audio: 'assets/audio/00 - Vocabulary.mp3'),
  Conversation(id: 3, name:'introducin yourself', text: 'Kill two birds with one stone', image: 'assets/conversations/hoi-thoai-tieng-anh.jpg',audio: 'assets/audio/00 - Vocabulary.mp3'),
  Conversation(id: 4, name:'introducin yourself', text: 'Takes two to tango', image: 'assets/conversations/hoi-thoai-tieng-anh.jpg',audio: 'assets/audio/00 - Vocabulary.mp3'),
];
return conversationdatadetails;
}
}
