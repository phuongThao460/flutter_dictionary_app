// ignore_for_file: unused_element

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dictionary_app/dbHelper/moor_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'moor_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    Directory dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dict_hh.db'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/dict_hh.db');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(tables: [VA, AV, Grammar, Idioms], daos: [DictionaryDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [
  VA,
  AV,
  Grammar,
  Idioms
], queries: {
  'addFavoriteGrammar': 'UPDATE grammar SET favorite = 1 WHERE id = ?',
  'addFavoriteWordAV': 'UPDATE av SET favorite = 1 WHERE id = ?',
  'addFavoriteWordVA': 'UPDATE va SET favorite = 1 WHERE id = ?',
  'addFavoriteIdioms': 'UPDATE idioms SET favorite = 1 WHERE id = ?',
  'removeFavoriteGrammar': 'UPDATE grammar SET favorite = 0 WHERE id = ?',
  'removeFavoriteWordAV': 'UPDATE av SET favorite = 0 WHERE id = ?',
  'removeFavoriteIdioms': 'UPDATE idioms SET favorite = 0 WHERE id = ?',
  'removeFavoriteWordVA': 'UPDATE va SET favorite = 0 WHERE id = ?',
  'historySearchAV': 'UPDATE av SET history = 1 WHERE id = ?',
  'historySearchVA': 'UPDATE va SET history = 1 WHERE id = ?',
})
class DictionaryDao extends DatabaseAccessor<AppDatabase>
    with _$DictionaryDaoMixin {
  final AppDatabase db;
  DictionaryDao(this.db) : super(db);
  //get all data from db
  Stream<List<GrammarData>> getGrammar() => select(grammar).watch();
  Stream<List<Idiom>> getIdioms() => select(idioms).watch();
  Stream<List<AVData>> getAV() => select(av).watch();
  Stream<List<VAData>> getVA() => select(va).watch();

  //searching
  Future<List<AVData>> getFilteredItemsAV(search) =>
      (select(av)..where((t) => t.word.like('$search%'))).get();
  Future<List<VAData>> getFilteredItemsVA(search) =>
      (select(va)..where((t) => t.word.like('$search%'))).get();

  //get list favorite
  Stream<List<GrammarData>> favoriteData() =>
      (select(grammar)..where((tbl) => tbl.favorite.equals(true))).watch();
  Stream<List<Idiom>> favoriteIdioms() =>
      (select(idioms)..where((tbl) => tbl.favorite.equals(true))).watch();
  Stream<List<AVData>> favoriteWordAV() =>
      (select(av)..where((tbl) => tbl.favorite.equals(true))).watch();
      Future<List<AVData>> favoriteWordAVF() =>
      (select(av)..where((tbl) => tbl.favorite.equals(true))).get();
  Stream<List<VAData>> favoriteWordVA() =>
      (select(va)..where((tbl) => tbl.favorite.equals(true))).watch();

  //get history searching
  Future<List<AVData>> historyWordAV() =>
      (select(av)..where((tbl) => tbl.history.equals(true))).get();
  Future<List<VAData>> historyWordVA() =>
      (select(va)..where((tbl) => tbl.history.equals(true))).get();

//add history
  Future historyAV(int id) {
    return transaction(() async {
      await historySearchAV(id);
    });
  }

  Future historyVA(int id) {
    return transaction(() async {
      await historySearchVA(id);
    });
  }

  //remove favorite
  Future removeFavGrammar(int id) {
    return transaction(() async {
      await removeFavoriteGrammar(id);
    });
  }

  Future removeFavIdioms(int id) {
    return transaction(() async {
      await removeFavoriteIdioms(id);
    });
  }

  Future removeFavAV(int id) {
    return transaction(() async {
      await removeFavoriteWordAV(id);
    });
  }

  Future removeFavVA(int id) {
    return transaction(() async {
      await removeFavoriteWordVA(id);
    });
  }

  //add favorite
  Future addFavGrammar(int id) {
    return transaction(() async {
      await addFavoriteGrammar(id);
    });
  }

  Future addFavIdioms(int id) {
    return transaction(() async {
      await addFavoriteIdioms(id);
    });
  }

  Future addFavAV(int id) {
    return transaction(() async {
      await addFavoriteWordAV(id);
    });
  }

  Future addFavVA(int id) {
    return transaction(() async {
      await addFavoriteWordVA(id);
    });
  }
}
