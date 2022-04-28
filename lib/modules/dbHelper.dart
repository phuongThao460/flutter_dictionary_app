// ignore_for_file: file_names, unnecessary_new, unused_local_variable
//json => student => map => toList
//giao dien co truoc sau do moi co dl
//ket noi => truy van => the hien len giao dien => dong ket noi
//copy dl => bo do dung duong dan ma android quy dinh
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_dictionary_app/modules/dictionary.dart';
import 'package:flutter_dictionary_app/modules/grammar-data.dart';
import 'package:flutter_dictionary_app/modules/idiom-data.dart';
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

  Future<List<Dictionary>> getAVDictionary() async {
    List<Dictionary> data = <Dictionary>[];
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM av');
    //var list = await db.query('av');
    for (var item in list.toList()) {
      data.add(Dictionary(
          id: item['id'] as int,
          html: item['html'] as String,
          word: item["word"] as String,
          description: item['description'] as String,
          pronounce: item["pronounce"] as String));
    }
    db.close();
    return data;
  }

  Future<List<Dictionary>> getVADictionary() async {
    List<Dictionary> data = <Dictionary>[];
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM va');
    //var list = await db.query('av');
    for (var item in list.toList()) {
      data.add(Dictionary(
          id: item['id'] as int,
          html: item['html'] as String,
          word: item["word"] as String,
          description: item['description'] as String,
          pronounce: item["pronounce"] as String));
    }
    db.close();
    return data;
  }

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

  Future<List<GrammarDataDetail>> getGrammarData() async {
    List<GrammarDataDetail> data = <GrammarDataDetail>[];
    Database db = await openDB();
    List<Map> list = await db.rawQuery('SELECT * FROM grammar');
    for (var item in list.toList()) {
      data.add(GrammarDataDetail(
        id: item['id'] as int,
        title: item['title'] as String,
        structure: item["structure"] as String,
        define: item['define'] as String,
        examples: item["examples"] as String,
      ));
    }
    
    return data;
  }
}
