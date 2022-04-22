// ignore_for_file: file_names

import 'package:flutter/material.dart';


class GrammarLevel extends StatefulWidget {
  const GrammarLevel({Key? key}) : super(key: key);


  @override
  State<GrammarLevel> createState() => _GrammarLevel();
}
class _GrammarLevel extends State<GrammarLevel> {
  String dropdownValue = 'A1';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(Icons.book),
      value: dropdownValue,      
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['A1', 'A2', 'B1', 'B2', 'C1']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
