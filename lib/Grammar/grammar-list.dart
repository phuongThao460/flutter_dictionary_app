// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/dbHelper.dart';
import 'package:flutter_dictionary_app/modules/grammar-data.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
  List<GrammarDataDetail> grammar = [];
class GrammarList extends StatefulWidget {
  static String routeName = "/grammar";

  @override
  State<GrammarList> createState() => _GrammarListState();
}

class _GrammarListState extends State<GrammarList> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
    List<GrammarDataDetail> grammar_list = await _helper!.getGrammarData();
    if (grammar_list.isNotEmpty) {
      setState(() {
        grammar = grammar_list;
      });
    } else {
      grammar = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Data: $grammar");
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Grammar"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
        ),
      ),
      body: ListView.builder(
          itemCount: grammar.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

              //nhap code add favourite tai day
              leading: IconButton(
                icon: const Icon(Icons.star_border),
                onPressed: () {/* Your code */},
              ),
              title: Text(grammar[index].title,
                  style: const TextStyle(fontSize: 16)),
            );
          }),
    );
  }
}
