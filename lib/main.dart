// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/idiom/idiom-list.dart';
import 'package:flutter_dictionary_app/routes.dart';
import 'package:flutter_dictionary_app/splashpage.dart';
import 'package:flutter_dictionary_app/translateVA/translate_va.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Slpashpage.routeName,
      routes: routes,
      title: 'Cat Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: IdiomList(),
    );
  }
}
