// ignore_for_file: file_names, unnecessary_new
// // ignore_for_file: file_names, unnecessary_new, unused_local_variable
// //json => student => map => toList
// //giao dien co truoc sau do moi co dl
// //ket noi => truy van => the hien len giao dien => dong ket noi
// //copy dl => bo do dung duong dan ma android quy dinh
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  copyDB() async {
    Directory docDirectory = await getApplicationSupportDirectory();
    String path = join(docDirectory.path, "dict_hh.db");
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join("assets", "dict_hh.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }

  openDB() async {
    Directory appDocDir = await getApplicationSupportDirectory();
    String databasePath = join(appDocDir.path, 'dict_hh.db');
    return await openDatabase(databasePath);
  }

  Future<int> updateFavoriteAV(int id) async {
    Database db = await openDB();
    Map<String, int> values = {'favorite': 1};
    var result = db.update('av', values, where: 'id=?', whereArgs: [id]);
    return result;
  }

  Future<int> updateFavoriteGrammar(int id) async {
    Database db = await openDB();
    var result = await db
        .rawUpdate("UPDATE grammar SET favorite = 1 WHERE id = ${(id)}");
    return result;
  }
}
