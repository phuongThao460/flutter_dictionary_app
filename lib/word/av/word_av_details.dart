// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, iterable_contains_unrelated_type

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_dictionary_app/homepage/homepage.dart';
import 'package:flutter_dictionary_app/modules/favourite-data.dart';
import 'package:flutter_dictionary_app/word/av/body.dart';

class WordAVDetails extends StatefulWidget {
  static String routeName = '/wordAV';

  @override
  State<WordAVDetails> createState() => _WordAVDetailsState();
}

class _WordAVDetailsState extends State<WordAVDetails> {

  @override
  Widget build(BuildContext context) {
    final GetAVDetailFromList dataAV =
        ModalRoute.of(context)!.settings.arguments as GetAVDetailFromList;
    bool isSaved = Favourite.dataDict.contains(dataAV.av);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 5,
          title: Text(
            dataAV.av.word,
            style: const TextStyle(fontSize: 23.1, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                
                Navigator.pushNamedAndRemoveUntil(context, Homepage.routeName, (Route<dynamic> route) => false).then((value) {
                  bool isSaved = AVData.historyAV.contains(dataAV.av);
                  return setState(() {
                    if (!isSaved) {
                      AVData.historyAV.add(dataAV.av);
                    }
                  });
                });
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (isSaved) {
                    Favourite.dataDict.add(dataAV.av);
                  }
                });
              },
              icon: Icon(
                isSaved ? Icons.star : Icons.star_border_outlined,
                color: isSaved ? Colors.yellow : null,
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
        body: Body(
          avData: dataAV.av,
        ));
  }
}

class GetAVDetailFromList {
  AVData av;
  GetAVDetailFromList({required this.av});
}
