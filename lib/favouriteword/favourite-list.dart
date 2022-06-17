// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_typing_uninitialized_variables, avoid_print, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_dictionary_app/modules/dictionary.dart';
import 'package:flutter_dictionary_app/modules/favourite-data.dart';
import 'package:flutter_dictionary_app/my_flutter_app_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';


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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
            isScrollable: true,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Color(0xFFDCAEFA),
            labelColor: Color(0xFFFFFFFF),
            indicatorColor: Color(0xFFDCAEFA),
            tabs: [
              Tab(text: 'AV'),
              Tab(text: 'VA'),
              Tab(text: 'Grammars'),
              Tab(text: 'Idioms'),
            ],
          ),
          title: const Text("Favourite"),
          backgroundColor: Colors.transparent,
        ),
        body: TabBarView(
          children: [
            _listWordAV(context),
            _listWordVA(context),
            _listGrammar(context),
            _listIdioms(context),
          ],
        ),
      ),
    );
  }

  Widget _listGrammar(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
    return StreamBuilder(
        stream: dao.favoriteData(),
        builder: (context, AsyncSnapshot<List<GrammarData>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          var data = snapshot.data ?? [];
          return ListView.builder(
              itemCount: data.length,
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
                        dao.removeFavGrammar(data[index].id);
                      },
                    )
                  ],
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    leading: const Icon(MyFlutterApp.cat),
                    title: Text(data[index].title,
                        style: const TextStyle(fontSize: 16)),
                  ),
                );
              });
        });
  }

  Widget _listIdioms(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
    return StreamBuilder(
        stream: dao.favoriteIdioms(),
        builder: (context, AsyncSnapshot<List<Idiom>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          var data = snapshot.data ?? [];
          return ListView.builder(
              itemCount: data.length,
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
                      onTap: () => dao.removeFavIdioms(data[index].id),
                    )
                  ],
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 10),
                    leading: const Icon(MyFlutterApp.cat),
                    title: Text(data[index].sentence,
                        style: const TextStyle(fontSize: 16)),
                  ),
                );
              });
        });
  }

  Widget _listWordAV(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
    return StreamBuilder(
        stream: dao.favoriteWordAV(),
        builder: (context, AsyncSnapshot<List<AVData>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          var av = snapshot.data ?? [];
          return ListView.builder(
              itemCount: av.length,
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
                        onTap: () => dao.removeFavAV(av[index].id),
                      )
                    ],
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      leading: const Icon(MyFlutterApp.cat),
                      title: Text(av[index].word,
                          style: const TextStyle(fontSize: 16)),
                      subtitle: Text(av[index].description,
                          style: const TextStyle(fontSize: 16)),
                    ));
              });
        });
  }

  Widget _listWordVA(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
    return StreamBuilder(
        stream: dao.favoriteWordVA(),
        builder: (context, AsyncSnapshot<List<VAData>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          var va = snapshot.data ?? [];
          return ListView.builder(
              itemCount: va.length,
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
                        onTap: () => dao.removeFavVA(va[index].id),
                      )
                    ],
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      leading: const Icon(MyFlutterApp.cat),
                      title: Text(va[index].word,
                          style: const TextStyle(fontSize: 16)),
                      subtitle: Text(va[index].description,
                          style: const TextStyle(fontSize: 16)),
                    ));
              });
        });
  }
}
