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
<<<<<<< HEAD
import 'package:flutter_dictionary_app/modules/conversation.dart';
import 'package:flutter_dictionary_app/modules/short-story.dart';
=======
import 'package:json_store/json_store.dart';
>>>>>>> a7e9dbafcf4f497df4c7aa7eb57fcbb7191cc29d
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  copyDB() async {
    Directory docDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory() as Directory
        : await getApplicationSupportDirectory();
    String path = join(docDirectory.path, "dict_hh.db");
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join("assets", "dict_hh.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }

  openDB() async {
    Directory appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory() as Directory
        : await getApplicationSupportDirectory();
    String databasePath = join(appDocDir.path, 'dict_hh.db');
    return await openDatabase(databasePath);
  }

  saveDataToLocal(String word) async {
    Directory appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory() as Directory
        : await getApplicationSupportDirectory();
    String databasePath = join(appDocDir.path, 'dict_hh.db');
    File file = await File('${appDocDir.path}/dict_hh.json').create();
    return file.writeAsString(word);
  }

  saveJsonStore() async {
    Database db = await openDB();
    List<Dictionary> data = [];
    Batch batch = await JsonStore().startBatch();
    await Future.forEach(data, (Dictionary _dicts) async {
      await JsonStore().setItem(
        'messages-${_dicts.id}',
        _dicts.toJson(),
        batch: batch,
      );
    });
    JsonStore().commitBatch(batch);
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
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/dict_hh.json');
    for (var item in list.toList()) {
      data.add(Dictionary(
          id: item['id'] as int,
          html: item['html'] as String,
          word: item["word"] as String,
          description: item['description'] as String,
          pronounce: item["pronounce"] as String));
    }
    for (var items in data) {
      final word = items.toJson();
      //Map<String, dynamic> decodeOptions = jsonDecode(word);
      String user = jsonEncode(Dictionary.fromJson(word));
      await file.writeAsString(user);
    }
    db.close();
    return data;
  }

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
  // Future<File> _localFile() async {
  //   final docDirectory = Platform.isAndroid
  //       ? await getExternalStorageDirectory()
  //       : await getApplicationSupportDirectory();
  //   String path = join(docDirectory!.path, "dict_hh.json");
  //   if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
  //     ByteData data = await rootBundle.load(join("assets", "dict_hh.json"));
  //     List<int> bytes =
  //         data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //     return await new File(path).writeAsBytes(bytes);
  //   }
  // }

  Future<List<Idiom>> getIdiomsData() async {
    List<Idiom> data = <Idiom>[];
    var listIdioms = [];
    Database db = await openDB();

    var list = await db.rawQuery('SELECT * FROM idioms');
    for (var item in list.toList()) {
      data.add(Idiom(
        id: item['id'] as int,
        text: item['text'] as String,
        meaning: item["meaning"] as String,
      ));
    }

    for (var element in data) {
      Map<String, dynamic> map = element.toJson();
      listIdioms.add(map);
      await saveDataToLocal(map.toString());
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
