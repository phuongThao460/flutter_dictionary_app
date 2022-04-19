// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/homepage/homepage-items.dart';

class HomeHeader extends StatefulWidget {

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 160,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text('Cat Dictionary'),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 12),
                        hintText: "Enter ",
                        prefixIcon: const Icon(Icons.search)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
    );
  }
}