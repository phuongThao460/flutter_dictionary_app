// ignore_for_file: unused_import, file_names, unnecessary_new

import 'package:flutter_dictionary_app/shortStory/short-story-list.dart';

class ShortStoryDataDetail {
  int id;
  String title;
  String story;
  String image;
  ShortStoryDataDetail({required this.id, required this.title, required this.story, required this.image});
  
  factory ShortStoryDataDetail.fromJson(Map<String, dynamic> res) {
    return new ShortStoryDataDetail(
        id: res['id'],
        title: res['title'],
        story: res['story'],
        image: res['image'],
        );
  }

  static List<ShortStoryDataDetail> init() {
  List<ShortStoryDataDetail> shortStoryDataDetails = [
  ShortStoryDataDetail(
    id: 1,
    title:'introducin yourself',
    story: 'Hit the hay.',
    image: 'assets/conversations/hoi-thoai-tieng-anh.jpg',
  ),
];
return shortStoryDataDetails;
}
}
