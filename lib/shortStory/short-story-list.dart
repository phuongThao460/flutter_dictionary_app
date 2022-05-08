// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_dictionary_app/modules/short-story.dart';
import 'package:flutter_dictionary_app/shortStory/short-story-list-detail.dart';
import 'package:provider/provider.dart';

List<ShortStory> storys = [];

class ShortStoryList extends StatefulWidget {
  static String routeName = "/shortStory";

  @override
  State<ShortStoryList> createState() => _ShortStoryListState();
}

class _ShortStoryListState extends State<ShortStoryList> {
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
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
      body: StreamBuilder(
          stream: dao.getShortStory(),
          builder: (context, AsyncSnapshot<List<Short_StoryData>>snapshot) {
            final data = snapshot.data ?? [];
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.black26,
                  );
                },
                itemCount: data.length,
                itemBuilder: (context, index) {
                  
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, StoryDetail.routeName,
                          arguments: StoryArgument(story: data[index]));
                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0),
                      leading: SizedBox(
                        height: 150,
                        width: 135,
                        child: Image.network(data[index].image,
                            fit: BoxFit.cover),
                      ),
                      textColor: Colors.black,
                      title: Text(data[index].title,
                          style: const TextStyle(fontSize: 16)),
                    ),
                  );
                });
          }),
    );
  }
}
