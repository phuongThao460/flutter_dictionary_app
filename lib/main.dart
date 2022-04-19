import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/routes.dart';
import 'package:flutter_dictionary_app/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Slpashpage.routeName,
      routes: routes,
      title: 'Cat Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}