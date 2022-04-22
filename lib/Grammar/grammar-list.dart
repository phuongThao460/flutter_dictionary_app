
// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/Grammar/grammar-level.dart';
class GrammarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  const [
      GrammarLevel(),
        Card(
            child: ListTile(
          title: Text("Grammar 1"), leading: Icon(Icons.star_border)
        )),
        Card(
          child: ListTile(
            title: Text("Grammar 2"), leading: Icon(Icons.star_border)
          ),
        ),
        Card(
            child: ListTile(
          title: Text("Grammar 3"), leading: Icon(Icons.star_border)
        )),
         Card(
            child: ListTile(
          title: Text("Grammar 4"), leading: Icon(Icons.star_border)
        )),
      ],
      shrinkWrap: true,
    );
  }
}
