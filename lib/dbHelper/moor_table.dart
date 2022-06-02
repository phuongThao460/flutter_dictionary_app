// ignore_for_file: camel_case_types

import 'package:drift/drift.dart';

class AV extends Table {
  IntColumn get id => integer()();
  TextColumn get word => text()();
  TextColumn get html => text()();
  TextColumn get description => text()();
  TextColumn get pronounce => text()();
  IntColumn get favorite => integer()();
  IntColumn get history => integer()();
}

class VA extends Table {
  IntColumn get id => integer()();
  TextColumn get word => text()();
  TextColumn get html => text()();
  TextColumn get description => text()();
  TextColumn get pronounce => text()();
  IntColumn get favorite => integer()();
  IntColumn get history => integer()();
}

class Idioms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sentence => text()();
  TextColumn get meaning => text()();
  IntColumn get favorite => integer()();
}

class Grammar extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get structure => text()();
  TextColumn get define => text()();
  TextColumn get examples => text()();
  IntColumn get favorite => integer()();
}
