// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/dictionary.dart';
import 'package:flutter_html/flutter_html.dart';

class WordDetails extends StatefulWidget {
  static String routeName = '/word';

  @override
  State<WordDetails> createState() => _WordDetailsState();
}

class _WordDetailsState extends State<WordDetails> {
  @override
  Widget build(BuildContext context) {
    final GetDetailFromList data =
        ModalRoute.of(context)!.settings.arguments as GetDetailFromList;
    final List<Tab> myTabs = <Tab>[
      const Tab(text: 'Eng - Viet'),
      const Tab(text: 'Eng - Eng'),
      const Tab(text: 'Grammar'),
      const Tab(text: 'Synonym'),
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 5,
          title: Text(
            data.dicts.word,
            style: const TextStyle(fontSize: 23.1, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_border),
            )
          ],
          flexibleSpace: Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
          ),
          bottom: TabBar(
            tabs: myTabs,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: const Color(0xFFDCAEFA),
            labelColor: const Color(0xFFFFFFFF),
            indicatorColor: const Color(0xFFDCAEFA),
            indicatorWeight: 5,
          ),
        ),
        body: SafeArea(
          child: Container(
            width: double.maxFinite,
            height: double.infinity,
            child: TabBarView(children: [
              _buildTab1(data.dicts.html),
              const Text('this is tab 2'),
              const Text('this is tab 3'),
              const Text('this is tab 4'),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildTab1(String dataHtml) {
    return SingleChildScrollView(
      child: Html(data: dataHtml),
    );
  }
}

class GetDetailFromList {
  Dictionary dicts;
  GetDetailFromList({required this.dicts});
}
