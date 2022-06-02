// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_dictionary_app/word/av/word_av_details.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    // final dao = Provider.of<DictionaryDao>(context);
    // return FutureBuilder(
    //   future: dao.getFilteredItemsAV(query),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       log('error');
    //     }
    //     var data = snapshot.data;
    //     return snapshot.hasData && query.isNotEmpty
    //         ? DictionaryList(dicts: data as List<AVData>)
    //         : Container();
    //   },
    // );
    return Container();
  }

  late final List<AVData> listExample;
  //Search(this.listExample);

  List<AVData> recentList = [];

  @override
  Widget buildSuggestions(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
    Future<List<AVData>> _getSearchData(String name) async {
      final historyWords = await dao.historyWordAV();
      if (historyWords.isNotEmpty) {
        for (var element in historyWords) {
          final e = element.word.toLowerCase();
          final queryWord = name.toLowerCase();
          if (e.contains(queryWord)) {
            return historyWords.where((element) {
              return e.contains(queryWord);
            }).toList();
          }
        }
      }
      return dao.getFilteredItemsAV(name);
    }

    return FutureBuilder(
      future: _getSearchData(query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          log('error');
        }
        var data = snapshot.data as List<AVData>;

        return snapshot.hasData && data.isNotEmpty
            ? DictionaryList(dicts: data)
            : Container(
                child: const Card(
                  elevation: 0,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('No Data was found')),
                ),
              );
      },
    );
  }
}

class DictionaryList extends StatefulWidget {
  List<AVData> dicts;
  DictionaryList({required this.dicts});

  @override
  State<DictionaryList> createState() => _DictionaryListState();
}

class _DictionaryListState extends State<DictionaryList> {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
    return ListView.builder(
        itemCount: widget.dicts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              dao.historyAV(widget.dicts[index].id);
              Navigator.pushNamed(context, WordAVDetails.routeName,
                  arguments: GetAVDetailFromList(av: widget.dicts[index]));
            },
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.dicts[index].word,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(widget.dicts[index].description),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
