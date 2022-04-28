// ignore_for_file: unused_import, file_names, unnecessary_new

import 'package:flutter_dictionary_app/idiom/idiom-list.dart';

class IdiomDataDetail {
  int id;
  String text;
  String meaning;
  IdiomDataDetail({required this.id, required this.text, required this.meaning});
  
  factory IdiomDataDetail.fromJson(Map<String, dynamic> res) {
    return new IdiomDataDetail(
        id: res['id'],
        text: res['text'],
        meaning: res['meaning'],
        );
  }

  static List<IdiomDataDetail> init() {
  List<IdiomDataDetail> idiomdatadetails = [
  IdiomDataDetail(
    id: 1,
    text: 'Hit the hay.',
    meaning: 'thường dùng khi bạn muốn nói với người khác rằng bạn thực sự mệt mỏi và cần đi ngủ'
  ),
  IdiomDataDetail(id: 2, text: 'Stabbed in the back', meaning: 'Stab someone in the back.'),
  IdiomDataDetail(id: 3, text: 'Kill two birds with one stone', meaning: 'một mũi tên trúng hai đích'),
  IdiomDataDetail(id: 4, text: 'Takes two to tango', meaning: 'Cần sự hợp tác của cả hai phía. Thường được sử dụng khi nói về một mối quan hệ hay giao dịch.'),
];
return idiomdatadetails;
}
}
