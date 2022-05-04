// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, iterable_contains_unrelated_type

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/dbHelper.dart';
import 'package:flutter_dictionary_app/modules/favourite-data.dart';
import 'package:flutter_dictionary_app/modules/idiom-data.dart';

List<Idiom> idioms = [];

class IdiomList extends StatefulWidget {
  static String routeName = "/idioms";

  @override
  State<IdiomList> createState() => _IdiomListState();
}

class _IdiomListState extends State<IdiomList> {
  DBHelper? _helper;
  bool isPress = false;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _helper = DBHelper();
    _helper!.copyDB();
    List<Idiom> idiomList = await _helper!.getIdiomsData();
    if (idiomList.isNotEmpty) {
      setState(() {
        idioms = idiomList;
      });
    } else {
      idioms = [];
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black26,
            );
          },
          itemCount: idioms.length,
          itemBuilder: (context, index) {
            Idiom data = idioms[index];
            bool isSaved = Favourite.dataIdioms.contains(data);
            return ListTile(
              onTap: () {
                setState(() {
                  if (isSaved) {
                    Favourite.dataIdioms.remove(data);
                  } else {
                    Favourite.dataIdioms.add(data);
                  }
                });
              },
              leading: Icon(
                isSaved ? Icons.star : Icons.star_border_outlined,
                color: isSaved ? Colors.yellow : null,
              ),
              title: Text(idioms[index].text,
                  style: const TextStyle(fontSize: 16)),
              subtitle: Text(idioms[index].meaning),
            );
          }),
    );
  }
}
