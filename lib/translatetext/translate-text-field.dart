// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TranslateTextField extends StatefulWidget {
  const TranslateTextField({Key? key}) : super(key: key);

  @override
  State<TranslateTextField> createState() => _Translatetextfield();
}

class _Translatetextfield extends State<TranslateTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
