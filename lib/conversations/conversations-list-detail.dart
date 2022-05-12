// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable
//liet ke chi tiet cua conversation

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/conversations/body.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';

class ConversationListDetail extends StatefulWidget {
  static String routeName = "/conversation-detail";
  @override
  State<ConversationListDetail> createState() => _ConversationListDetailState();
}

class _ConversationListDetailState extends State<ConversationListDetail> {
  @override
  Widget build(BuildContext context) {
    final ConversationArgument conversationArgument =
        ModalRoute.of(context)!.settings.arguments as ConversationArgument;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Conversation"),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
          ),
        ),
        body: Body(conversationData: conversationArgument.conversation));
  }
}

class ConversationArgument {
  ConversationData conversation;
  ConversationArgument({required this.conversation});
}
