// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_database.dart';
import 'package:flutter_html/flutter_html.dart';

class Body extends StatefulWidget {
  VAData vaData;
  Body({required this.vaData});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    VAData.historyVA.add(widget.vaData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.maxFinite,
        height: double.infinity,
        child: _buildTab1(widget.vaData.html),
      ),
    );
  }

  Widget _buildTab1(String dataHtml) {
    return SingleChildScrollView(
      child: Html(data: dataHtml),
    );
  }
}
