// ignore_for_file: unused_import, file_names

import 'package:flutter_dictionary_app/idiom/idiom-list.dart';

class IdiomDataDetail {
  int id;
  String text;
  IdiomDataDetail({required this.id, required this.text});
  static List<IdiomDataDetail> init() {
  List<IdiomDataDetail> idiomdatadetails = [
  IdiomDataDetail(
    id: 1,
    text: 'Hit the hay.',
  ),
  IdiomDataDetail(id: 2, text: 'Stabbed in the back'),
  IdiomDataDetail(id: 3, text: 'Kill two birds with one stone'),
  IdiomDataDetail(id: 4, text: 'Takes two to tango'),
];
return idiomdatadetails;
}
}
