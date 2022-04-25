// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, unused_field, avoid_function_literals_in_foreach_calls, unnecessary_string_interpolations, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/dbHelper.dart';
import 'package:flutter_dictionary_app/modules/dictionary.dart';

class ListWord extends StatefulWidget {
  @override
  State<ListWord> createState() => _ListWordState();
}

class _ListWordState extends State<ListWord> {
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();
  final TextEditingController _searchingTextController =
      TextEditingController();
  DBHelper? _helper;
  final _listDict = [];
  var items = [];
  String keywords = "";

  @override
  void initState() {
    super.initState();
    _helper = DBHelper();
    _helper!.copyDB();
    //_listDict = <Dictionary>[];
    _helper!.getDictionary().then((value) {
      setState(() {
        items = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchingTextController,
              onChanged: (value) {
                keywords = value;
                setState(() {
                  //_listDict = _helper!.getSearchingWord(value) as List;
                });
              },
              decoration: const InputDecoration(
                  hintText: 'Search...',
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  )),
            ),
          ),
          FutureBuilder(
            future: _helper!.getSearchingWord(keywords),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('error');
              }
              var data = snapshot.data;
              return snapshot.hasData
                  ? DictionaryList(dicts: data as List<Dictionary>)
                  : const Center(child: Text('No word found'));
            },
          )
        ],
      ),
    );
  }
}

class DictionaryList extends StatelessWidget {
  List<Dictionary> dicts;
  DictionaryList({required this.dicts});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: dicts.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('${dicts[index].word}'),
                subtitle: Text('${dicts[index].description}'),
              ),
            );
          }),
    );
  }
}
