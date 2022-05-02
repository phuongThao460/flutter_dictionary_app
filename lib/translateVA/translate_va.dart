// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, unused_field, avoid_function_literals_in_foreach_calls, unnecessary_string_interpolations, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/dbHelper.dart';
import 'package:flutter_dictionary_app/modules/dictionary.dart';

class TranslateVA extends StatefulWidget {
  static String routeName = '/vadicts';
  @override
  State<TranslateVA> createState() => _TranslateVAState();
}

class _TranslateVAState extends State<TranslateVA> {
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
    // _helper!.getVADictionary().then((value) {
    //   setState(() {
    //     items = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: const Text("Viet - Eng Dictionary"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
        ),
      ),
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
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
          ),
          FutureBuilder(
            future: _helper!.getSearchingWordFromVA(keywords),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('error');
              }
              var data = snapshot.data;
              return snapshot.hasData &&
                      _searchingTextController.text.isNotEmpty
                  ? DictionaryList(dicts: data as List<Dictionary>)
                  : Container();
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
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${dicts[index].word}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text('${dicts[index].description}'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
