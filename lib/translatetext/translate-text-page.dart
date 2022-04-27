// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/translatetext/translate-text-body.dart';
import 'package:flutter_dictionary_app/translatetext/translate-text-field.dart';
import 'package:flutter_dictionary_app/translatetext/translate-text-header.dart';
//import 'package:flutter_dictionary_app/homepage/homepage-items.dart';

class TranslateText extends StatelessWidget {
  static String routeName = '/translatetext';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [(TranslateHeader()), const TranslateTextBody(), const TranslateTextField()],
        ),
      ),
    );
  }
}
