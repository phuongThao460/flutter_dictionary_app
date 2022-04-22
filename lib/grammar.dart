// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/Grammar/grammar-list.dart';
import 'package:flutter_dictionary_app/Grammar/grammarheader.dart';
//import 'package:flutter_dictionary_app/homepage/homepage-items.dart';

class Grammar extends StatelessWidget {
  static String routeName = '/grammar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [GrammarHeader(),GrammarList()],
        ),
      ),
    );
  }
}
