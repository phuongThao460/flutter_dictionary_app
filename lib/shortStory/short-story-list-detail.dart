// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/short-story.dart';

class StoryDetail extends StatefulWidget {
  static String routeName = '/story-detail';
  @override
  State<StoryDetail> createState() => _StoryDetailState();
}

class _StoryDetailState extends State<StoryDetail> {
  @override
  Widget build(BuildContext context) {
    final StoryArgument argument =
        ModalRoute.of(context)!.settings.arguments as StoryArgument;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Short Story"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              argument.story.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 12,),
            Text(argument.story.story,
              style: const TextStyle(fontSize: 16))
          ],
        ),
      ),
    );
  }
}

class StoryArgument {
  ShortStory story;
  StoryArgument({required this.story});
}
