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
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: 'Enter the text here', border: OutlineInputBorder()),
          ),
        ),
        TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF9921E8)),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return const Color(0xFF9921E8);
                  }
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed)) {
                    return const Color(0xFF9921E8);
                  }
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () {},
            child: const Text('Translate'))
      ],
    );
  }
}
