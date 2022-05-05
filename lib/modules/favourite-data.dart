// ignore_for_file: file_names

import 'package:flutter_dictionary_app/modules/dictionary.dart';
import 'package:flutter_dictionary_app/modules/idiom-data.dart';
import 'package:flutter_dictionary_app/modules/conversation.dart';

<<<<<<< HEAD
class FavouriteDataDetail {
  int id;
  String text;
  FavouriteDataDetail({required this.id, required this.text});
  static List<IdiomDataDetail> data = [];
  static List<ConversationDataDetail> data1 = [];
  static List<FavouriteDataDetail> init() {
    List<FavouriteDataDetail> favouritedatadetails = [
      FavouriteDataDetail(
          id: 1,
          text:
              'Noun: Nouns are people, places, or things, They tell us what we are talking about. The words cat, Jack, rock, Africa, & it are nouns.'),
      FavouriteDataDetail(
          id: 2,
          text:
              'Adjectives: Adjectives modify, or describe, nouns. The words tall, beautiful, irresponsible, & boring are adjectives.'),
    ];
    return favouritedatadetails;
  }
=======
class Favourite {
  static List<Idiom> dataIdioms = [];
  static List<Dictionary> dataDict = [];
>>>>>>> a7e9dbafcf4f497df4c7aa7eb57fcbb7191cc29d
}
