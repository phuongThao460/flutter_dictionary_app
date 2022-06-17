// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, iterable_contains_unrelated_type

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_dictionary_app/modules/favourite-data.dart';
import 'package:flutter_dictionary_app/word/va/body.dart';
import 'package:provider/provider.dart';

class WordVADetails extends StatefulWidget {
  static String routeName = '/wordVA';

  @override
  State<WordVADetails> createState() => _WordVADetailssState();
}

class _WordVADetailssState extends State<WordVADetails> {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);
    final GetVA dataVA = ModalRoute.of(context)!.settings.arguments as GetVA;
    List<VAData> fav = Favourite.dataVADict;
    return StreamBuilder(
        stream: dao.favoriteWordVA(),
        builder: (context, AsyncSnapshot<List<VAData>> snapshot) {
          final data = snapshot.data ?? [];
                  final constanin = fav.contains(dataVA.va);
                  bool isSaved = data.contains(dataVA.va);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                titleSpacing: 5,
                title: Text(
                  dataVA.va.word,
                  style: const TextStyle(
                      fontSize: 23.1, fontWeight: FontWeight.bold),
                ),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                actions: [
                  IconButton(
                    onPressed: () async {
                      if (!constanin) {
                        setState(() {
                          fav.add(dataVA.va);
                        });
                      }
                      dao.addFavoriteWordVA(dataVA.va.id).then((value) {
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
                    icon: Icon(
                      isSaved || constanin
                          ? Icons.star
                          : Icons.star_border_outlined,
                      color: isSaved || constanin ? Colors.yellow : null,
                    ),
                  )
                ],
                flexibleSpace: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
                ),
              ),
              body: Body(vaData: dataVA.va));
        });
  }
}

class GetVA {
  VAData va;
  GetVA({required this.va});
}
