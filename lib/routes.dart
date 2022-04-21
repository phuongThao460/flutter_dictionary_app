import 'package:flutter/cupertino.dart';
import 'package:flutter_dictionary_app/homepage/homepage.dart';
import 'package:flutter_dictionary_app/splashpage.dart';
import 'package:flutter_dictionary_app/word/word_details.dart';

final Map<String, WidgetBuilder> routes = {
  Slpashpage.routeName:(context) => Slpashpage(),
  Homepage.routeName:(context) => Homepage(),
  WordDetails.routeName:(context) => WordDetails()
};
