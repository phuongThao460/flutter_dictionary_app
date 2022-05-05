// ignore_for_file: file_names, unnecessary_new, unused_local_variable
//json => student => map => toList
//giao dien co truoc sau do moi co dl
//ket noi => truy van => the hien len giao dien => dong ket noi
//copy dl => bo do dung duong dan ma android quy dinh
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_dictionary_app/modules/dictionary.dart';
import 'package:flutter_dictionary_app/modules/grammar-data.dart';
import 'package:flutter_dictionary_app/modules/idiom-data.dart';
import 'package:flutter_dictionary_app/modules/conversation.dart';
import 'package:flutter_dictionary_app/modules/short-story.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  copyDB() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, "dict_hh.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join("assets", "dict_hh.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await new File(path).writeAsBytes(bytes);
    }
  }

  openDB() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'dict_hh.db');
    return await openDatabase(databasePath);
  }

  Future<List<Dictionary>> getSearchingWordFromAV(String keywords) async {
    Database db = await openDB();
    List<Map<String, dynamic>> word =
        await db.query('av', where: 'word LIKE ?', whereArgs: ['%$keywords%']);
    List<Dictionary> dict = word.map((e) => Dictionary.fromJson(e)).toList();
    return dict;
  }

  Future<List<Dictionary>> getSearchingWordFromVA(String keywords) async {
    Database db = await openDB();
    List<Map<String, dynamic>> word =
        await db.query('va', where: 'word LIKE ?', whereArgs: ['%$keywords%']);
    List<Dictionary> dict = word.map((e) => Dictionary.fromJson(e)).toList();
    return dict;
  }

  // Future<List<Dictionary>> getAVDictionary() async {
  //   List<Dictionary> data = <Dictionary>[];
  //   Database db = await openDB();
  //   var list = await db.rawQuery('SELECT * FROM av');
  //   //var list = await db.query('av');
  //   for (var item in list.toList()) {
  //     data.add(Dictionary(
  //         id: item['id'] as int,
  //         html: item['html'] as String,
  //         word: item["word"] as String,
  //         description: item['description'] as String,
  //         pronounce: item["pronounce"] as String));
  //   }
  //   db.close();
  //   return data;
  // }

  // Future<List<Dictionary>> getVADictionary() async {
  //   List<Dictionary> data = <Dictionary>[];
  //   Database db = await openDB();
  //   var list = await db.rawQuery('SELECT * FROM va');
  //   //var list = await db.query('av');
  //   for (var item in list.toList()) {
  //     data.add(Dictionary(
  //         id: item['id'] as int,
  //         html: item['html'] as String,
  //         word: item["word"] as String,
  //         description: item['description'] as String,
  //         pronounce: item["pronounce"] as String));
  //   }
  //   db.close();
  //   return data;
  // }

  Future<List<IdiomDataDetail>> getIdiomsData() async {
    List<IdiomDataDetail> data = <IdiomDataDetail>[];
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM idioms');
    for (var item in list.toList()) {
      data.add(IdiomDataDetail(
        id: item['id'] as int,
        text: item['text'] as String,
        meaning: item["meaning"] as String,
      ));
    }
    db.close();
    return data;
  }

  Future<List<Grammar>> getGrammarData() async {
    List<Grammar> data = <Grammar>[];
    Database db = await openDB();
    List<Map> list = await db.rawQuery('SELECT * FROM grammar');
    for (var item in list.toList()) {
      data.add(Grammar(
        id: item['id'] as int,
        title: item['title'] as String,
        structure: item["structure"] as String,
        define: item['define'] as String,
        examples: item["examples"] as String,
      ));
    }
    
    return data;
  }

  Future<List<ConversationDataDetail>> getConversationsData() async {
    List<ConversationDataDetail> data = <ConversationDataDetail>[];
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM conversation');
    for (var item in list.toList()) {
      data.add(ConversationDataDetail(
        id: item['id'] as int,
        name: item['name'] as String,
        text: item['text'] as String,
        image: item['image'] as String,
        audio: item['audio'] as String,
      ));
    }
    db.close();
    return data;
  }

  Future<List<ShortStoryDataDetail>> getStoryData() async {
    List<ShortStoryDataDetail> data = <ShortStoryDataDetail>[];
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM short_story');
    for (var item in list.toList()) {
      data.add(ShortStoryDataDetail(
        id: item['id'] as int,
        title: item['title'] as String,
        story: item['story'] as String,
        image: item['image'] as String,
      ));
    }
    db.close();
    return data;
  }
}
