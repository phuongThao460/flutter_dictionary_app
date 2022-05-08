// ignore_for_file: camel_case_types

import 'package:drift/drift.dart';

class AV extends Table {
  IntColumn get id => integer()();
  TextColumn get word => text()();
  TextColumn get html => text()();
  TextColumn get description => text()();
  TextColumn get pronounce => text()();
}

class VA extends Table {
  IntColumn get id => integer()();
  TextColumn get word => text()();
  TextColumn get html => text()();
  TextColumn get description => text()();
  TextColumn get pronounce => text()();
}

class Short_Story extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get story => text()();
  TextColumn get image => text()();
}

class Idioms extends Table {
  IntColumn get id => integer()();
  TextColumn get sentence => text()();
  TextColumn get meaning => text()();
}

class Grammar extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get structure => text()();
  TextColumn get define => text()();
  TextColumn get examples => text()();
}

class Conversation extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get content => text()();
  TextColumn get image => text()();
  TextColumn get audio => text()();
}