// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/dbHelper.dart';
import 'package:flutter_dictionary_app/modules/dictionary.dart';
import 'package:flutter_dictionary_app/word/word_details.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  DBHelper? _helper;
  List<String> historySearch = [];
  var items = [];
  String keywords = "";
  SharedPreferences? prefs;
  @override
  void initState() {
    super.initState();
    _helper = DBHelper();
    _helper!.copyDB();
    _helper!.getAVDictionary().then((value) {
      setState(() {
        items = value;
      });
    });
  }

  _addSearchingWordToHistory(String words) async {
    prefs = await SharedPreferences.getInstance();
    historySearch.add(words);
    prefs!.setStringList("Words", historySearch);
  }

  _getHistorySearching() async {
    prefs = await SharedPreferences.getInstance();
    historySearch = prefs!.getStringList("Words")!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 160,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text('Cat Dictionary'),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 40,
                alignment: Alignment.bottomCenter,
                child: TypeAheadField<Dictionary>(
                    debounceDuration: const Duration(milliseconds: 500),
                    textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 12),
                          hintText: "Enter ",
                          prefixIcon: const Icon(Icons.search)),
                    ),
                    suggestionsCallback: historySearch.isNotEmpty
                        ? _getHistorySearching()
                        : _helper!.getSearchingWordFromAV,
                    itemBuilder: (context, Dictionary? dicts) {
                      final getWord = dicts!;
                      return Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Text(
                                  '${getWord.word}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text('${getWord.description}'),
                              ],
                            ),
                          ));
                    },
                    onSuggestionSelected: (Dictionary? dicts) {
                      final dictionary = dicts!;
                      _addSearchingWordToHistory(dicts.word);
                      Navigator.pushNamed(context, WordDetails.routeName,
                          arguments: GetDetailFromList(dicts: dictionary));
                    }),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class DictionaryList extends StatelessWidget {
  List<Dictionary> dicts;
  DictionaryList({required this.dicts});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: dicts.length,
          itemBuilder: (context, index) {
            return ListBody(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WordDetails.routeName,
                        arguments: GetDetailFromList(dicts: dicts[index]));
                  },
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
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
                  ),
                ),
              ],
            );
          }),
    );
  }
}
