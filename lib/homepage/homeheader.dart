// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations, unnecessary_new, unnecessary_null_comparison, prefer_if_null_operators

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_dictionary_app/word/av/word_av_details.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  List<AVData> historyWords = AVData.historyAV;
  TextEditingController searchTextController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    if (historyWords.isNotEmpty) {
      setState(() {
        _setData();
        _getData();
      });
    }
  }

  _setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'historyWords', historyWords.map((e) => jsonEncode(e)).toList());
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('historyWords') != null) {
      var data = (prefs.getStringList('historyWords')) as List;
      setState(() {
        historyWords =
            data.map((e) => AVData.fromJson(json.decode(e))).toList();
      });
    }
    return historyWords;
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
                  child: _buildSearchBar(context, historyWords)),
            ),
          ],
        ),
      ),
    ]);
  }

  _buildSearchBar(BuildContext context, List<AVData> history) {
    final dao = Provider.of<DictionaryDao>(context);
    Future<List<AVData>> _getSearchData(String name) async {
      historyWords = await _getData() as List<AVData>;
      for (var element in historyWords) {
        final e = element.word.toLowerCase();
        final queryWord = name.toLowerCase();
        if (e.contains(queryWord)) {
          return historyWords.where((element) {
            return e.contains(queryWord);
          }).toList();
        }
      }
      return dao.getFilteredItemsAV(name);
    }

    return TypeAheadField<AVData>(
        getImmediateSuggestions: true,
        hideSuggestionsOnKeyboardHide: false,
        debounceDuration: const Duration(milliseconds: 200),
        textFieldConfiguration: TextFieldConfiguration(
          controller: searchTextController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(top: 12),
              hintText: "Enter ",
              prefixIcon: const Icon(Icons.search)),
        ),
        suggestionsCallback: _getSearchData,
        itemBuilder: (context, AVData dicts) {
          final getWord = dicts;
          return Card(
              elevation: 2,
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
        onSuggestionSelected: (AVData dicts) {
          final dictionary = dicts;
          searchTextController.clear();
          setState(() {
            _getData();
          });
          Navigator.pushNamed(context, WordAVDetails.routeName,
              arguments: GetAVDetailFromList(av: dictionary));
        });
  }
}
