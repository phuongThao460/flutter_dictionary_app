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
    Directory dbFolder = await getExternalStorageDirectory() as Directory;
    final file = File(p.join(dbFolder.path, 'dict_hh.db'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/dict_hh.db');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [VA, AV, Grammar, Conversation, Idioms, Short_Story], daos: [DictionaryDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [VA, AV, Grammar, Conversation, Idioms, Short_Story])
class DictionaryDao extends DatabaseAccessor<AppDatabase>
    with _$DictionaryDaoMixin {
  final AppDatabase db;
  DictionaryDao(this.db) : super(db);
  Stream<List<ConversationData>> getConversation() => select(conversation).watch();
  Stream<List<GrammarData>> getGrammar() => select(grammar).watch();
  Stream<List<Idiom>> getIdiom() => select(idioms).watch();
  Stream<List<Short_StoryData>> getShortStory() => select(shortStory).watch();

  Future<List<AVData>> getFilteredItemsAV(search) =>
      (select(av)..where((t) => t.word.like('$search%'))).get();

  Future<List<VAData>> getFilteredItemsVA(search) =>
      (select(va)..where((t) => t.word.like('$search%'))).get();

  
  Future<List<AVData>> getKursSymbol(String querySearch) {
    return customSelect(
        'SELECT * from av WHERE word LIKE ?',
        variables: [Variable.withString(querySearch)],
        readsFrom: {av}).map((QueryRow row) {
      return AVData(
        id: row.read<int>('id'),
        word: row.read<String>('word'),
        html: row.read<String>('html'),
        pronounce: row.read<String>('pronounce'),
        description: row.read<String>('description'),
      );
    }).get();
  }

  // Stream<List<AVData>> getAllData() {
  //   // select all categories and load how many associated entries there are for
  //   // each category
  //   return customSelect(
  //     'SELECT * FROM av;',
  //     readsFrom: {
  //       av
  //     }, // used for the stream: the stream will update when either table changes
  //   ).watch().map((rows) {
  //     // we get list of rows here. We just have to turn the raw data from the row into a
  //     // CategoryWithCount. As we defined the Category table earlier, drift knows how to parse
  //     // a category. The only thing left to do manually is extracting the amount
  //     return rows.map((row) => AVData.fromJson(row.data, this)).toList();
  //   });
  // }
}
