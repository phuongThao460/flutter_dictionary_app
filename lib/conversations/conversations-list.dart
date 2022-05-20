// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/conversation.dart';
import 'package:flutter_dictionary_app/conversations/conversations-list-detail.dart';

class ConversationList extends StatefulWidget {
  static String routeName = "/conversations";

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  bool isPress = false;
  List<Conversation> conversations = Conversation.init();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversation"),
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
                itemCount: conversations.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ConversationListDetail.routeName,
                          arguments: ConversationArgument(
                              conversation: conversations[index]));
                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: SizedBox(
                        height: 150,
                        width: 135,
                        child: Image.asset(conversations[index].image,
                            fit: BoxFit.cover),
                      ),
                      textColor: Colors.black,
                      title: Text(conversations[index].name,
                          style: const TextStyle(fontSize: 16)),
                    ),
                  );
                })
          ,
    );
  }
}
