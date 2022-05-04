// ignore_for_file: file_names, use_key_in_widget_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/Grammar/grammar-list-detail.dart';
import 'package:flutter_dictionary_app/modules/dbHelper.dart';
import 'package:flutter_dictionary_app/modules/grammar-data.dart';

//import 'package:flutter_slidable/flutter_slidable.dart';
List<Grammar> grammar = [];

class GrammarList extends StatefulWidget {
  static String routeName = "/grammar";

  @override
  State<GrammarList> createState() => _GrammarListState();
}

class _GrammarListState extends State<GrammarList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
    List<Grammar> grammarList = await _helper!.getGrammarData();
    if (grammarList.isNotEmpty) {
      setState(() {
        grammar = grammarList;
      });
    } else {
      grammar = [];
    }
  }

  @override
  Widget build(BuildContext context) {
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
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, GrammarListDetail.routeName,
                    arguments: GrammarArgument(grammar: grammar[index]));
              },
              child: Card(
                  child: ListTile(
                //nhap code add favourite tai day
                leading: IconButton(
                  icon: const Icon(Icons.star_border),
                  onPressed: () {/* Your code */},
                ),
                title: Text(grammar[index].title,
                    style: const TextStyle(fontSize: 16)),

                //subtitle: Text(
                //  grammardatadetail.define, style: const TextStyle(fontSize: 14),
                //  ),
              )),
            );
          }),
    );
  }
}
