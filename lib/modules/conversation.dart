// ignore_for_file: unused_import, file_names, unnecessary_new

import 'package:flutter_dictionary_app/conversations/conversations-list.dart';

class ConversationDataDetail {
  int id;
  String text;
  String name;
  String image;
  String audio;
  ConversationDataDetail({required this.id, required this.name, required this.text, required this.image, required this.audio});
  
  factory ConversationDataDetail.fromJson(Map<String, dynamic> res) {
    return new ConversationDataDetail(
        id: res['id'],
        name: res['name'],
        text: res['text'],
        image: res['image'],
        audio: res['audio'],
        );
  }

  static List<ConversationDataDetail> init() {
  List<ConversationDataDetail> conversationdatadetails = [
  ConversationDataDetail(
    id: 1,
    name:'introducin yourself',
    text: 'Hit the hay.',
    image: 'assets/conversations/hoi-thoai-tieng-anh.jpg',
    audio: 'assets/audio/00 - Vocabulary.mp3'
  ),
  ConversationDataDetail(id: 2, name:'introducin yourself', text: 'Stabbed in the back', image: ' ',audio: 'assets/audio/00 - Vocabulary.mp3'),
  ConversationDataDetail(id: 3, name:'introducin yourself', text: 'Kill two birds with one stone', image: 'assets/conversations/hoi-thoai-tieng-anh.jpg',audio: 'assets/audio/00 - Vocabulary.mp3'),
  ConversationDataDetail(id: 4, name:'introducin yourself', text: 'Takes two to tango', image: 'assets/conversations/hoi-thoai-tieng-anh.jpg',audio: 'assets/audio/00 - Vocabulary.mp3'),
];
return conversationdatadetails;
}
}
