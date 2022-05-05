// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/dictionary.dart';
import 'package:flutter_dictionary_app/modules/favourite-data.dart';
import 'package:flutter_dictionary_app/modules/idiom-data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteList extends StatefulWidget {
  static String routeName = "/favorites";

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  List<Idiom> favouritedatadetails = Favourite.dataIdioms;
  List<Dictionary> favoriteWord = Favourite.dataDict;

  @override
  void initState() {
    super.initState();
    if (favouritedatadetails.isNotEmpty) {
      _setData();
      _getData();
    } else {
      _getData();
    }
  }

  _setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'idioms', favouritedatadetails.map((e) => jsonEncode(e)).toList());
        prefs.setStringList(
        'word', favoriteWord.map((e) => jsonEncode(e)).toList());
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
    if (prefs.getStringList('word') != null) {
      print(prefs.getStringList('word'));
      var data = (prefs.getStringList('word')) as List;
      setState(() {
        favoriteWord =
            data.map((e) => Dictionary.fromJson(json.decode(e))).toList();
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
              Tab(text: 'Word'),
              Tab(text: 'Grammar'),
              Tab(text: 'Idiom'),
            ],
          ),
          title: const Text("Favourite"),
          backgroundColor: Colors.transparent,
        ),
        body: TabBarView(
          children: [
            //code truyen favourite vao
            _listWord(favoriteWord),
            const Text('Grammar1'),
            _listIdioms(favouritedatadetails),
          ],
        ),
      ),
    );
  }
}

Widget _listIdioms(List<Idiom> favouritedatadetails) {
  return ListView.builder(
      itemCount: favouritedatadetails.length,
      itemBuilder: (BuildContext context, int index) {
        return Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actions: const <Widget>[],
          //tab phải
          secondaryActions: const <Widget>[
            IconSlideAction(
              caption: 'Remove',
              color: Color(0xFF9921E8),
              icon: Icons.delete,
              //onTap: () => _showSnackBar('Archive'),
            )
          ],
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            leading: const Icon(Icons.note),
            title: Text(favouritedatadetails[index].text,
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
          secondaryActions: const <Widget>[
            IconSlideAction(
              caption: 'Remove',
              color: Color(0xFF9921E8),
              icon: Icons.delete,
              //onTap: () => _showSnackBar('Archive'),
            )
          ],
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            leading: const Icon(Icons.note),
            title: Text(word[index].word, style: const TextStyle(fontSize: 16)),
            subtitle: Text(word[index].description,
                style: const TextStyle(fontSize: 16)),
          ),
        );
      });
}
