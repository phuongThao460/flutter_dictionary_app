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
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              argument.story.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(argument.story.story)
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
