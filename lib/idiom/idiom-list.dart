// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, iterable_contains_unrelated_type

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:provider/provider.dart';

List<Idiom> idioms = [];

class IdiomList extends StatefulWidget {
  static String routeName = "/idioms";

  @override
  State<IdiomList> createState() => _IdiomListState();
}

class _IdiomListState extends State<IdiomList> {
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Idiom"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
        ),
      ),
      body: StreamBuilder(
          stream: dao.getIdioms(),
          builder: (context, AsyncSnapshot<List<Idiom>> snapshot) {
            final idiom = snapshot.data ?? [];
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.black26,
                  );
                },
                itemCount: idiom.length,
                itemBuilder: (context, index) {
                  var isSaved = idiom[index].favorite;
                  return ListTile(
                    onTap: () async {
                      dao.addFavoriteIdioms(idiom[index].id).then((value) {
                        if (value > 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Add to favorite successfull')));
                        }
                      }).catchError((onError) {
                        log(onError.toString());
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(onError.toString())));
                      });
                    },
                    leading: Icon(
                      isSaved == 1 ? Icons.star : Icons.star_border_outlined,
                      color: isSaved == 1 ? Colors.yellow : null,
                    ),
                    title: Text(idiom[index].sentence,
                        style: const TextStyle(fontSize: 16)),
                    subtitle: Text(idiom[index].meaning),
                  );
                });
          }),
    );
  }
}
