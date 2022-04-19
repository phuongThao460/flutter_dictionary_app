// ignore_for_file: use_key_in_widget_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/homepage/homepage.dart';

class Slpashpage extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Homepage.routeName, (Route<dynamic> route) => false);
    });
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(95, 114, 190, 1.0),
                    Color.fromRGBO(153, 33, 232, 1.0)
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Cat dictionary...',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ))),
    );
  }
}
