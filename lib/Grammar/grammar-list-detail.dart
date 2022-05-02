// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable
//liet ke chi tiet cua grammar
import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/grammar-data.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';

class GrammarListDetail extends StatelessWidget {
  static String routeName = "/grammar-detail";
  @override
  Widget build(BuildContext context) {
    final GrammarArgument grammarArgument =
        ModalRoute.of(context)!.settings.arguments as GrammarArgument;
    return Scaffold(
        appBar: AppBar(
          title: Text(grammarArgument.grammar.title),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("***Define***",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text(grammarArgument.grammar.define,
                    style: const TextStyle(fontSize: 16)),
              ),
              const Text("***Structure***",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text(grammarArgument.grammar.structure,
                    style: const TextStyle(fontSize: 16)),
              ),
              const Text("***Examples***",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(grammarArgument.grammar.examples,
                    style: const TextStyle(fontSize: 16)),
              )
            ],
          ),
        ));
  }
}

class GrammarArgument {
  Grammar grammar;
  GrammarArgument({required this.grammar});
}
