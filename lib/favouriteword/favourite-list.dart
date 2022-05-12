// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_typing_uninitialized_variables, avoid_print, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_dictionary_app/idiom/idiom-list.dart';
import 'package:flutter_dictionary_app/modules/dictionary.dart';
import 'package:flutter_dictionary_app/modules/favourite-data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteList extends StatefulWidget {
  static String routeName = "/favorites";

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  List<Idiom> favouritedatadetails = Favourite.dataIdioms;
  List favoriteWord = Favourite.dataDict;
  List favWord = Favourite.dataVADict;
  List<GrammarData> favGrammar = Favourite.dataGram;
  List<Dictionary> dictsList = [];

  @override
  void initState() {
    super.initState();

    if (favouritedatadetails.isNotEmpty) {
      _setIdiomsData();
      _getData();
    } else {
      _getData();
    }
    if (favoriteWord.isNotEmpty) {
      _setWordData();
      _getWordData();
    } else {
      _getWordData();
    }
    if (favWord.isNotEmpty) {
      _setVAWordData();
      _getVAWordData();
    } else {
      _getVAWordData();
    }
    if (favGrammar.isNotEmpty) {
      _setGrammData();
      _getGrammData();
    } else {
      _getGrammData();
    }
  }

  _fromAVtoDictionary(AVData avData) {
    return new Dictionary(
        id: avData.id,
        word: avData.word,
        html: avData.html,
        description: avData.description,
        pronounce: avData.pronounce);
  }

  _fromVAtoDictionary(VAData avData) {
    return new Dictionary(
        id: avData.id,
        word: avData.word,
        html: avData.html,
        description: avData.description,
        pronounce: avData.pronounce);
  }

  _setIdiomsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'idioms', favouritedatadetails.map((e) => jsonEncode(e)).toList());
  }

  _setWordData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'word', favoriteWord.map((e) => jsonEncode(e)).toList());
  }

  _setVAWordData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'wordVA', favWord.map((e) => jsonEncode(e)).toList());
  }

  _setGrammData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'grammar', favGrammar.map((e) => jsonEncode(e)).toList());
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('idioms') != null) {
      print(prefs.getStringList('idioms'));
      var data = (prefs.getStringList('idioms')) as List;
      setState(() {
        favouritedatadetails =
            data.map((e) => Idiom.fromJson(json.decode(e))).toList();
      });
    }
  }

  _getVAWordData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('wordVA') != null) {
      var data = (prefs.getStringList('wordVA')) as List;
      favWord = data.map((e) => VAData.fromJson(json.decode(e))).toList();
      setState(() {
        for (var element in favWord) {
          final dataVA = _fromVAtoDictionary(element) as Dictionary;
          dictsList.add(dataVA);
        }
        //print(dictsList);
      });
    }
  }

  _getWordData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('word') != null) {
      var data = (prefs.getStringList('word')) as List;
      favoriteWord = data.map((e) => AVData.fromJson(json.decode(e))).toList();
      setState(() {
        for (var element in favoriteWord) {
          final data = _fromAVtoDictionary(element) as Dictionary;
          dictsList.add(data);
        }
        //print(dictsList);
      });
    }
  }

  _getGrammData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('grammar') != null) {
      var data = (prefs.getStringList('grammar')) as List;
      setState(() {
        favGrammar =
            data.map((e) => GrammarData.fromJson(json.decode(e))).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
          ),
          bottom: const TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Color(0xFFDCAEFA),
            labelColor: Color(0xFFFFFFFF),
            indicatorColor: Color(0xFFDCAEFA),
            tabs: [
              Tab(text: 'Words'),
              Tab(text: 'Grammars'),
              Tab(text: 'Idioms'),
            ],
          ),
          title: const Text("Favourite"),
          backgroundColor: Colors.transparent,
        ),
        body: TabBarView(
          children: [
            _listWord(dictsList),
            _listGrammar(favGrammar),
            _listIdioms(favouritedatadetails),
          ],
        ),
      ),
    );
  }

  Widget _listGrammar(List<GrammarData> fav) {
    return ListView.builder(
        itemCount: fav.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actions: const <Widget>[],
            //tab phải
            secondaryActions: [
              IconSlideAction(
                caption: 'Remove',
                color: const Color(0xFF9921E8),
                icon: Icons.delete,
                onTap: () {
                  fav.remove(fav[index]);
                  setState(() {});
                },
              )
            ],
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              leading: const Icon(Icons.note),
              title:
                  Text(fav[index].title, style: const TextStyle(fontSize: 16)),
            ),
          );
        });
  }

  Widget _listIdioms(List<Idiom> favouritedatadetails) {
    return ListView.builder(
        itemCount: favouritedatadetails.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actions: const <Widget>[],
            //tab phải
            secondaryActions: [
              IconSlideAction(
                caption: 'Remove',
                color: const Color(0xFF9921E8),
                icon: Icons.delete,
                onTap: () => idioms.remove(idioms[index]),
              )
            ],
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              leading: const Icon(Icons.note),
              title: Text(favouritedatadetails[index].sentence,
                  style: const TextStyle(fontSize: 16)),
            ),
          );
        });
  }

  Widget _listWord(List<Dictionary> word) {
    return ListView.builder(
        itemCount: word.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
              actionPane: const SlidableDrawerActionPane(),
              actions: const <Widget>[],
              //tab phải
              secondaryActions: [
                IconSlideAction(
                  caption: 'Remove',
                  color: const Color(0xFF9921E8),
                  icon: Icons.delete,
                  onTap: () => word.remove(word[index]),
                )
              ],
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                leading: const Icon(Icons.note),
                title: Text(word[index].word,
                    style: const TextStyle(fontSize: 16)),
                subtitle: Text(word[index].description,
                    style: const TextStyle(fontSize: 16)),
              ));
        });
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildListAV(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildListVA(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class AVItem implements ListItem {
  AVData heading;

  AVItem({required this.heading});

  @override
  Widget buildListAV(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      leading: const Icon(Icons.note),
      title: Text(heading.word, style: const TextStyle(fontSize: 16)),
      subtitle: Text(heading.description, style: const TextStyle(fontSize: 16)),
    );
  }

  @override
  Widget buildListVA(BuildContext context) => const SizedBox();
}

/// A ListItem that contains data to display a message.
class VAItem implements ListItem {
  AVData word;
  VAItem({required this.word});

  @override
  Widget buildListAV(BuildContext context) => const SizedBox();

  @override
  Widget buildListVA(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      leading: const Icon(Icons.note),
      title: Text(word.word, style: const TextStyle(fontSize: 16)),
      subtitle: Text(word.description, style: const TextStyle(fontSize: 16)),
    );
  }
}
