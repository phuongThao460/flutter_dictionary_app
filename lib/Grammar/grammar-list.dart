// ignore_for_file: file_names, use_key_in_widget_constructors, unnecessary_new, must_be_immutable, avoid_print, prefer_final_fields, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/Grammar/grammar-list-detail.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:provider/provider.dart';

class GrammarList extends StatefulWidget {
  static String routeName = "/grammar";

  @override
  State<GrammarList> createState() => _GrammarListState();
}

class _GrammarListState extends State<GrammarList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<DictionaryDao>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Grammar"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
        ),
      ),
      body: StreamBuilder(
          stream: dao.getGrammar(),
          builder: (context, AsyncSnapshot<List<GrammarData>> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            var data = snapshot.data ?? [];
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var saved = data[index].favorite;
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, GrammarListDetail.routeName,
                                arguments:
                                    GrammarArgument(grammar: data[index]));
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: () async {
                                      dao
                                          .addFavoriteGrammar(data[index].id)
                                          .then((value) {
                                        if (value > 0) {
                                          print(saved);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Add to favorite successfull')));
                                        }
                                      }).catchError((onError) {
                                        print(onError.toString());
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text(onError.toString())));
                                      });
                                    },
                                    icon: Icon(saved == 1
                                        ? Icons.star
                                        : Icons.star_border_outlined),
                                    color: saved == 1 ? Colors.yellow : null,
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(data[index].title,
                                      style: const TextStyle(fontSize: 16)),
                                ),
                              ],
                            ),
                          ));
                    })
                : Container();
          }),
    );
  }
}
