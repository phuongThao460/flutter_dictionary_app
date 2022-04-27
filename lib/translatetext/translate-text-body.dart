
// ignore_for_file: file_names, avoid_print

import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/material.dart';

class TranslateTextBody extends StatefulWidget {
  const TranslateTextBody({Key? key}) : super(key: key);

  @override
  State<TranslateTextBody> createState() => _Translatetextbody();
}

class _Translatetextbody extends State<TranslateTextBody> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ToggleSwitch(
          minWidth: 90.0,
          cornerRadius: 20.0,
          activeBgColors: [
            [Colors.green[800]!],
            [Colors.red[800]!]
          ],
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.grey,
          inactiveFgColor: Colors.white,
          initialLabelIndex: 1,
          totalSwitches: 2,
          labels: const ['EN-VI', 'VI-EN'],
          radiusStyle: true,
          onToggle: (index) {
            print('switched to: $index');
          }),
    ]);
  }
}
