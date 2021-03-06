import 'package:flutter/cupertino.dart';
import 'package:flutter_dictionary_app/Grammar/grammar-list-detail.dart';
import 'package:flutter_dictionary_app/Grammar/grammar-list.dart';
import 'package:flutter_dictionary_app/conversations/conversations-list-detail.dart';
import 'package:flutter_dictionary_app/favouriteword/favourite-list.dart';
import 'package:flutter_dictionary_app/homepage/homepage.dart';
import 'package:flutter_dictionary_app/idiom/idiom-list.dart';
import 'package:flutter_dictionary_app/shortStory/short-story-list-detail.dart';
import 'package:flutter_dictionary_app/splashpage.dart';
import 'package:flutter_dictionary_app/translateVA/translate_va.dart';
import 'package:flutter_dictionary_app/word/av/word_av_details.dart';
import 'package:flutter_dictionary_app/conversations/conversations-list.dart';
import 'package:flutter_dictionary_app/shortStory/short-story-list.dart';
import 'package:flutter_dictionary_app/word/va/word_va_details.dart';

final Map<String, WidgetBuilder> routes = {
  Slpashpage.routeName: (context) => Slpashpage(),
  Homepage.routeName: (context) => Homepage(),
  WordAVDetails.routeName: (context) => WordAVDetails(),
  WordVADetails.routeName: (context) => WordVADetails(),
  TranslateVA.routeName: (context) => TranslateVA(),
  IdiomList.routeName: (context) => IdiomList(),
  GrammarList.routeName: (context) => GrammarList(),
  GrammarListDetail.routeName:(context) => GrammarListDetail(),
  FavouriteList.routeName: (context) => FavouriteList(),
  ConversationList.routeName: (context) => ConversationList(),
  ConversationListDetail.routeName: (context) => ConversationListDetail(),
  ShortStoryList.routeName: (context) => ShortStoryList(),
  StoryDetail.routeName:(context) => StoryDetail(),
};
