// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/homepage/homeheader.dart';
import 'package:flutter_dictionary_app/homepage/homepage-items.dart';
//import 'package:flutter_dictionary_app/homepage/homepage-items.dart';

class Homepage extends StatelessWidget {
  static String routeName = '/homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [HomeHeader(), HomepageItems()],
        ),
      ),
    );
  }
}
