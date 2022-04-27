// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/idiom-data.dart';

class IdiomList extends StatelessWidget {
  static String routeName = "/idioms";
  @override
  Widget build(BuildContext context) {
    List<IdiomDataDetail> idiomdatadetails = IdiomDataDetail.init();
    return Scaffold(
      appBar: AppBar(
          title: const Align(
        child: Text("Idiom"),
      )),
      body: ListView.builder(
          itemCount: idiomdatadetails.length,
          itemBuilder: (BuildContext context, int index) {
            IdiomDataDetail idiomdatadetail = idiomdatadetails[index];
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              leading: IconButton(
                icon: const Icon(Icons.star_border),
                onPressed: () {/* Your code */},
              ),
              title: Text(idiomdatadetail.text,
                  style: const TextStyle(fontSize: 16)),
            );
          }),
    );
  }

  // The child of the Slidable is what the user sees when the
  // component is not dragge
}
