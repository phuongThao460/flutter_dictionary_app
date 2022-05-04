// ignore_for_file: unused_import, file_names, unnecessary_new

import 'package:flutter_dictionary_app/idiom/idiom-list.dart';

class Idiom {
  int id;
  String text;
  String meaning;
  Idiom({required this.id, required this.text, required this.meaning});
  
  factory Idiom.fromJson(Map<String, dynamic> res) {
    return new Idiom(
        id: res['id'],
        text: res['text'],
        meaning: res['meaning'],
        );
  }
Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'meaning': meaning
      };
  static List<Idiom> init() {
  List<Idiom> idiomdatadetails = [
  Idiom(
    id: 1,
    text: 'Hit the hay.',
    meaning: 'thường dùng khi bạn muốn nói với người khác rằng bạn thực sự mệt mỏi và cần đi ngủ'
  ),
  Idiom(id: 2, text: 'Stabbed in the back', meaning: 'Stab someone in the back.'),
  Idiom(id: 3, text: 'Kill two birds with one stone', meaning: 'một mũi tên trúng hai đích'),
  Idiom(id: 4, text: 'Takes two to tango', meaning: 'Cần sự hợp tác của cả hai phía. Thường được sử dụng khi nói về một mối quan hệ hay giao dịch.'),
];
return idiomdatadetails;
}
}
