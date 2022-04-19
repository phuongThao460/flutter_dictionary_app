// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static String routeName = "/homepage";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 159,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color.fromRGBO(95, 114, 190, 1),
              Color.fromRGBO(153, 33, 232, 1)
            ])),
        child: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Cat Dictionary'),
        ),
      ),
    );
  }
}
