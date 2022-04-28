// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/dbHelper.dart';
import 'package:flutter_dictionary_app/modules/idiom-data.dart';
List<IdiomDataDetail> idioms = [];
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
    List<IdiomDataDetail> idiom_list = await _helper!.getIdiomsData();
    if (idiom_list.isNotEmpty) {
      setState(() {
        idioms = idiom_list;
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
      body: ListView.builder(
          itemCount: idioms.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              leading: IconButton(
                icon: isPress
                    ? const Icon(Icons.star, color: Colors.yellow,)
                    : const Icon(Icons.star_border),
                onPressed: () {
                  setState(() {
                    isPress = true;
                  });
                },
              ),
              title:
                  Text(idioms[index].text, style: const TextStyle(fontSize: 16)),
              subtitle: Text(idioms[index].meaning),
            );
          }),
    );
  }
}
