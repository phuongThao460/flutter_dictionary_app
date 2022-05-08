// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, iterable_contains_unrelated_type

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_dictionary_app/modules/favourite-data.dart';
import 'package:flutter_html/flutter_html.dart';

class WordVADetails extends StatefulWidget {
  static String routeName = '/word';

  @override
  State<WordVADetails> createState() => _WordVADetailssState();
}

class _WordVADetailssState extends State<WordVADetails> {
  //List<AVData> favWord = Favourite.dataDict;

  @override
  Widget build(BuildContext context) {
    final GetVADetailFromList dataVA =
        ModalRoute.of(context)!.settings.arguments as GetVADetailFromList;
    bool isSaved = 
        Favourite.dataDict.contains(dataVA.va);
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 5,
            title: Text(
              dataVA.va.word,
              style:
                  const TextStyle(fontSize: 23.1, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (isSaved) {
                      //Favourite.dataDict.remove(data.dicts);
                    } else {
                      //Favourite.dataDict.add(data.dicts);
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
          body: SafeArea(
            child: Container(
              width: double.maxFinite,
              height: double.infinity,
              child: _buildTab1(dataVA.va.html),
            ),
          ),
        ));
  }

  Widget _buildTab1(String dataHtml) {
    return SingleChildScrollView(
      child: Html(data: dataHtml),
    );
  }
}

class GetVADetailFromList {
  VAData va;
  GetVADetailFromList({required this.va});
}
