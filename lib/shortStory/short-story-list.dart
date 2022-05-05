// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/dbHelper.dart';
import 'package:flutter_dictionary_app/modules/short-story.dart';
import 'package:flutter_dictionary_app/shortStory/short-story-list-detail.dart';
// import 'package:flutter_dictionary_app/conversations/short-story-list-detail.dart';

List<ShortStory> storys = [];

class ShortStoryList extends StatefulWidget {
  static String routeName = "/shortStory";

  @override
  State<ShortStoryList> createState() => _ShortStoryListState();
}

class _ShortStoryListState extends State<ShortStoryList> {
  DBHelper? _helper;
  bool isPress = false;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _helper = DBHelper();
    _helper!.copyDB();
    List<ShortStory> storyList = await _helper!.getStoryData();
    if (storyList.isNotEmpty) {
      setState(() {
        storys = storyList;
      });
    } else {
      storys = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Short Story"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
        ),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black26,
            );
          },
          itemCount: storys.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, StoryDetail.routeName, arguments: StoryArgument(story: storys[index]));
              },
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                leading: SizedBox(
                  height: 150,
                  width: 135,
                  child: Image.network(storys[index].image, fit: BoxFit.cover),
                ),
                textColor: Colors.black,
                title: Text(storys[index].title,
                    style: const TextStyle(fontSize: 16)),
              ),
            );
          }),
    );
  }
}
