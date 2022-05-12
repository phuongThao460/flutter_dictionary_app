// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_dictionary_app/modules/conversation.dart';
import 'package:flutter_dictionary_app/conversations/conversations-list-detail.dart';
import 'package:provider/provider.dart';

List<Conversation> conversations = [];

class ConversationList extends StatefulWidget {
  static String routeName = "/conversations";

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
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
      body: StreamBuilder(
          stream: dao.getConversation(),
          builder: (context, AsyncSnapshot<List<ConversationData>> snapshot) {
            final convers = snapshot.data ?? [];
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.black26,
                  );
                },
                itemCount: convers.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ConversationListDetail.routeName,
                          arguments: ConversationArgument(
                              conversation: convers[index]));
                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: SizedBox(
                        height: 150,
                        width: 135,
                        child: Image.asset(convers[index].image,
                            fit: BoxFit.cover),
                      ),
                      textColor: Colors.black,
                      title: Text(convers[index].name,
                          style: const TextStyle(fontSize: 16)),
                    ),
                  );
                });
          }),
    );
  }
}
