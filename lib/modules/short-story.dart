// ignore_for_file: unused_import, file_names, unnecessary_new

import 'package:flutter_dictionary_app/shortStory/short-story-list.dart';

class ShortStory {
  int id;
  String title;
  String story;
  String image;
  ShortStory({required this.id, required this.title, required this.story, required this.image});
  
  factory ShortStory.fromJson(Map<String, dynamic> res) {
    return new ShortStory(
        id: res['id'],
        title: res['title'],
        story: res['story'],
        image: res['image'],
        );
  }

  static List<ShortStory> init() {
  List<ShortStory> shortStoryDataDetails = [
  ShortStory(
    id: 1,
    title:'introducin yourself',
    story: 'Hit the hay.',
    image: 'assets/conversations/hoi-thoai-tieng-anh.jpg',
  ),
];
return shortStoryDataDetails;
}
}
