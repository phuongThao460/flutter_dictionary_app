// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class VAData extends DataClass implements Insertable<VAData> {
  final int id;
  final String word;
  final String html;
  final String description;
  final String pronounce;
  final int favorite;
  final int history;
  VAData(
      {required this.id,
      required this.word,
      required this.html,
      required this.description,
      required this.pronounce,
      required this.favorite,
      required this.history});
  factory VAData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return VAData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      word: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}word'])!,
      html: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}html'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      pronounce: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pronounce'])!,
      favorite: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
      history: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}history'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['html'] = Variable<String>(html);
    map['description'] = Variable<String>(description);
    map['pronounce'] = Variable<String>(pronounce);
    map['favorite'] = Variable<int>(favorite);
    map['history'] = Variable<int>(history);
    return map;
  }

  VACompanion toCompanion(bool nullToAbsent) {
    return VACompanion(
      id: Value(id),
      word: Value(word),
      html: Value(html),
      description: Value(description),
      pronounce: Value(pronounce),
      favorite: Value(favorite),
      history: Value(history),
    );
  }

  factory VAData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VAData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      html: serializer.fromJson<String>(json['html']),
      description: serializer.fromJson<String>(json['description']),
      pronounce: serializer.fromJson<String>(json['pronounce']),
      favorite: serializer.fromJson<int>(json['favorite']),
      history: serializer.fromJson<int>(json['history']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'html': serializer.toJson<String>(html),
      'description': serializer.toJson<String>(description),
      'pronounce': serializer.toJson<String>(pronounce),
      'favorite': serializer.toJson<int>(favorite),
      'history': serializer.toJson<int>(history),
    };
  }

  VAData copyWith(
          {int? id,
          String? word,
          String? html,
          String? description,
          String? pronounce,
          int? favorite,
          int? history}) =>
      VAData(
        id: id ?? this.id,
        word: word ?? this.word,
        html: html ?? this.html,
        description: description ?? this.description,
        pronounce: pronounce ?? this.pronounce,
        favorite: favorite ?? this.favorite,
        history: history ?? this.history,
      );
  @override
  String toString() {
    return (StringBuffer('VAData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('html: $html, ')
          ..write('description: $description, ')
          ..write('pronounce: $pronounce, ')
          ..write('favorite: $favorite, ')
          ..write('history: $history')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, word, html, description, pronounce, favorite, history);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VAData &&
          other.id == this.id &&
          other.word == this.word &&
          other.html == this.html &&
          other.description == this.description &&
          other.pronounce == this.pronounce &&
          other.favorite == this.favorite &&
          other.history == this.history);
}

class VACompanion extends UpdateCompanion<VAData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> html;
  final Value<String> description;
  final Value<String> pronounce;
  final Value<int> favorite;
  final Value<int> history;
  const VACompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.html = const Value.absent(),
    this.description = const Value.absent(),
    this.pronounce = const Value.absent(),
    this.favorite = const Value.absent(),
    this.history = const Value.absent(),
  });
  VACompanion.insert({
    required int id,
    required String word,
    required String html,
    required String description,
    required String pronounce,
    required int favorite,
    required int history,
  })  : id = Value(id),
        word = Value(word),
        html = Value(html),
        description = Value(description),
        pronounce = Value(pronounce),
        favorite = Value(favorite),
        history = Value(history);
  static Insertable<VAData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? html,
    Expression<String>? description,
    Expression<String>? pronounce,
    Expression<int>? favorite,
    Expression<int>? history,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (html != null) 'html': html,
      if (description != null) 'description': description,
      if (pronounce != null) 'pronounce': pronounce,
      if (favorite != null) 'favorite': favorite,
      if (history != null) 'history': history,
    });
  }

  VACompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? html,
      Value<String>? description,
      Value<String>? pronounce,
      Value<int>? favorite,
      Value<int>? history}) {
    return VACompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      html: html ?? this.html,
      description: description ?? this.description,
      pronounce: pronounce ?? this.pronounce,
      favorite: favorite ?? this.favorite,
      history: history ?? this.history,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (html.present) {
      map['html'] = Variable<String>(html.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (pronounce.present) {
      map['pronounce'] = Variable<String>(pronounce.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<int>(favorite.value);
    }
    if (history.present) {
      map['history'] = Variable<int>(history.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VACompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('html: $html, ')
          ..write('description: $description, ')
          ..write('pronounce: $pronounce, ')
          ..write('favorite: $favorite, ')
          ..write('history: $history')
          ..write(')'))
        .toString();
  }
}

class $VATable extends VA with TableInfo<$VATable, VAData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VATable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String?> word = GeneratedColumn<String?>(
      'word', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _htmlMeta = const VerificationMeta('html');
  @override
  late final GeneratedColumn<String?> html = GeneratedColumn<String?>(
      'html', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _pronounceMeta = const VerificationMeta('pronounce');
  @override
  late final GeneratedColumn<String?> pronounce = GeneratedColumn<String?>(
      'pronounce', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<int?> favorite = GeneratedColumn<int?>(
      'favorite', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _historyMeta = const VerificationMeta('history');
  @override
  late final GeneratedColumn<int?> history = GeneratedColumn<int?>(
      'history', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, word, html, description, pronounce, favorite, history];
  @override
  String get aliasedName => _alias ?? 'va';
  @override
  String get actualTableName => 'va';
  @override
  VerificationContext validateIntegrity(Insertable<VAData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('html')) {
      context.handle(
          _htmlMeta, html.isAcceptableOrUnknown(data['html']!, _htmlMeta));
    } else if (isInserting) {
      context.missing(_htmlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('pronounce')) {
      context.handle(_pronounceMeta,
          pronounce.isAcceptableOrUnknown(data['pronounce']!, _pronounceMeta));
    } else if (isInserting) {
      context.missing(_pronounceMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    } else if (isInserting) {
      context.missing(_favoriteMeta);
    }
    if (data.containsKey('history')) {
      context.handle(_historyMeta,
          history.isAcceptableOrUnknown(data['history']!, _historyMeta));
    } else if (isInserting) {
      context.missing(_historyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  VAData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return VAData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $VATable createAlias(String alias) {
    return $VATable(attachedDatabase, alias);
  }
}

class AVData extends DataClass implements Insertable<AVData> {
  final int id;
  final String word;
  final String html;
  final String description;
  final String pronounce;
  final int favorite;
  final int history;
  AVData(
      {required this.id,
      required this.word,
      required this.html,
      required this.description,
      required this.pronounce,
      required this.favorite,
      required this.history});
  factory AVData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AVData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      word: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}word'])!,
      html: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}html'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      pronounce: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pronounce'])!,
      favorite: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
      history: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}history'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['html'] = Variable<String>(html);
    map['description'] = Variable<String>(description);
    map['pronounce'] = Variable<String>(pronounce);
    map['favorite'] = Variable<int>(favorite);
    map['history'] = Variable<int>(history);
    return map;
  }

  AVCompanion toCompanion(bool nullToAbsent) {
    return AVCompanion(
      id: Value(id),
      word: Value(word),
      html: Value(html),
      description: Value(description),
      pronounce: Value(pronounce),
      favorite: Value(favorite),
      history: Value(history),
    );
  }

  factory AVData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AVData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      html: serializer.fromJson<String>(json['html']),
      description: serializer.fromJson<String>(json['description']),
      pronounce: serializer.fromJson<String>(json['pronounce']),
      favorite: serializer.fromJson<int>(json['favorite']),
      history: serializer.fromJson<int>(json['history']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'html': serializer.toJson<String>(html),
      'description': serializer.toJson<String>(description),
      'pronounce': serializer.toJson<String>(pronounce),
      'favorite': serializer.toJson<int>(favorite),
      'history': serializer.toJson<int>(history),
    };
  }

  AVData copyWith(
          {int? id,
          String? word,
          String? html,
          String? description,
          String? pronounce,
          int? favorite,
          int? history}) =>
      AVData(
        id: id ?? this.id,
        word: word ?? this.word,
        html: html ?? this.html,
        description: description ?? this.description,
        pronounce: pronounce ?? this.pronounce,
        favorite: favorite ?? this.favorite,
        history: history ?? this.history,
      );
  @override
  String toString() {
    return (StringBuffer('AVData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('html: $html, ')
          ..write('description: $description, ')
          ..write('pronounce: $pronounce, ')
          ..write('favorite: $favorite, ')
          ..write('history: $history')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, word, html, description, pronounce, favorite, history);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AVData &&
          other.id == this.id &&
          other.word == this.word &&
          other.html == this.html &&
          other.description == this.description &&
          other.pronounce == this.pronounce &&
          other.favorite == this.favorite &&
          other.history == this.history);
}

class AVCompanion extends UpdateCompanion<AVData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> html;
  final Value<String> description;
  final Value<String> pronounce;
  final Value<int> favorite;
  final Value<int> history;
  const AVCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.html = const Value.absent(),
    this.description = const Value.absent(),
    this.pronounce = const Value.absent(),
    this.favorite = const Value.absent(),
    this.history = const Value.absent(),
  });
  AVCompanion.insert({
    required int id,
    required String word,
    required String html,
    required String description,
    required String pronounce,
    required int favorite,
    required int history,
  })  : id = Value(id),
        word = Value(word),
        html = Value(html),
        description = Value(description),
        pronounce = Value(pronounce),
        favorite = Value(favorite),
        history = Value(history);
  static Insertable<AVData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? html,
    Expression<String>? description,
    Expression<String>? pronounce,
    Expression<int>? favorite,
    Expression<int>? history,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (html != null) 'html': html,
      if (description != null) 'description': description,
      if (pronounce != null) 'pronounce': pronounce,
      if (favorite != null) 'favorite': favorite,
      if (history != null) 'history': history,
    });
  }

  AVCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? html,
      Value<String>? description,
      Value<String>? pronounce,
      Value<int>? favorite,
      Value<int>? history}) {
    return AVCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      html: html ?? this.html,
      description: description ?? this.description,
      pronounce: pronounce ?? this.pronounce,
      favorite: favorite ?? this.favorite,
      history: history ?? this.history,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (html.present) {
      map['html'] = Variable<String>(html.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (pronounce.present) {
      map['pronounce'] = Variable<String>(pronounce.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<int>(favorite.value);
    }
    if (history.present) {
      map['history'] = Variable<int>(history.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AVCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('html: $html, ')
          ..write('description: $description, ')
          ..write('pronounce: $pronounce, ')
          ..write('favorite: $favorite, ')
          ..write('history: $history')
          ..write(')'))
        .toString();
  }
}

class $AVTable extends AV with TableInfo<$AVTable, AVData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AVTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String?> word = GeneratedColumn<String?>(
      'word', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _htmlMeta = const VerificationMeta('html');
  @override
  late final GeneratedColumn<String?> html = GeneratedColumn<String?>(
      'html', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _pronounceMeta = const VerificationMeta('pronounce');
  @override
  late final GeneratedColumn<String?> pronounce = GeneratedColumn<String?>(
      'pronounce', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<int?> favorite = GeneratedColumn<int?>(
      'favorite', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _historyMeta = const VerificationMeta('history');
  @override
  late final GeneratedColumn<int?> history = GeneratedColumn<int?>(
      'history', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, word, html, description, pronounce, favorite, history];
  @override
  String get aliasedName => _alias ?? 'av';
  @override
  String get actualTableName => 'av';
  @override
  VerificationContext validateIntegrity(Insertable<AVData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('html')) {
      context.handle(
          _htmlMeta, html.isAcceptableOrUnknown(data['html']!, _htmlMeta));
    } else if (isInserting) {
      context.missing(_htmlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('pronounce')) {
      context.handle(_pronounceMeta,
          pronounce.isAcceptableOrUnknown(data['pronounce']!, _pronounceMeta));
    } else if (isInserting) {
      context.missing(_pronounceMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    } else if (isInserting) {
      context.missing(_favoriteMeta);
    }
    if (data.containsKey('history')) {
      context.handle(_historyMeta,
          history.isAcceptableOrUnknown(data['history']!, _historyMeta));
    } else if (isInserting) {
      context.missing(_historyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  AVData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AVData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AVTable createAlias(String alias) {
    return $AVTable(attachedDatabase, alias);
  }
}

class GrammarData extends DataClass implements Insertable<GrammarData> {
  final int id;
  final String title;
  final String structure;
  final String define;
  final String examples;
  final int favorite;
  GrammarData(
      {required this.id,
      required this.title,
      required this.structure,
      required this.define,
      required this.examples,
      required this.favorite});
  factory GrammarData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GrammarData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      structure: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}structure'])!,
      define: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}define'])!,
      examples: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}examples'])!,
      favorite: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['structure'] = Variable<String>(structure);
    map['define'] = Variable<String>(define);
    map['examples'] = Variable<String>(examples);
    map['favorite'] = Variable<int>(favorite);
    return map;
  }

  GrammarCompanion toCompanion(bool nullToAbsent) {
    return GrammarCompanion(
      id: Value(id),
      title: Value(title),
      structure: Value(structure),
      define: Value(define),
      examples: Value(examples),
      favorite: Value(favorite),
    );
  }

  factory GrammarData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GrammarData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      structure: serializer.fromJson<String>(json['structure']),
      define: serializer.fromJson<String>(json['define']),
      examples: serializer.fromJson<String>(json['examples']),
      favorite: serializer.fromJson<int>(json['favorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'structure': serializer.toJson<String>(structure),
      'define': serializer.toJson<String>(define),
      'examples': serializer.toJson<String>(examples),
      'favorite': serializer.toJson<int>(favorite),
    };
  }

  GrammarData copyWith(
          {int? id,
          String? title,
          String? structure,
          String? define,
          String? examples,
          int? favorite}) =>
      GrammarData(
        id: id ?? this.id,
        title: title ?? this.title,
        structure: structure ?? this.structure,
        define: define ?? this.define,
        examples: examples ?? this.examples,
        favorite: favorite ?? this.favorite,
      );
  @override
  String toString() {
    return (StringBuffer('GrammarData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('structure: $structure, ')
          ..write('define: $define, ')
          ..write('examples: $examples, ')
          ..write('favorite: $favorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, structure, define, examples, favorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GrammarData &&
          other.id == this.id &&
          other.title == this.title &&
          other.structure == this.structure &&
          other.define == this.define &&
          other.examples == this.examples &&
          other.favorite == this.favorite);
}

class GrammarCompanion extends UpdateCompanion<GrammarData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> structure;
  final Value<String> define;
  final Value<String> examples;
  final Value<int> favorite;
  const GrammarCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.structure = const Value.absent(),
    this.define = const Value.absent(),
    this.examples = const Value.absent(),
    this.favorite = const Value.absent(),
  });
  GrammarCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String structure,
    required String define,
    required String examples,
    required int favorite,
  })  : title = Value(title),
        structure = Value(structure),
        define = Value(define),
        examples = Value(examples),
        favorite = Value(favorite);
  static Insertable<GrammarData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? structure,
    Expression<String>? define,
    Expression<String>? examples,
    Expression<int>? favorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (structure != null) 'structure': structure,
      if (define != null) 'define': define,
      if (examples != null) 'examples': examples,
      if (favorite != null) 'favorite': favorite,
    });
  }

  GrammarCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? structure,
      Value<String>? define,
      Value<String>? examples,
      Value<int>? favorite}) {
    return GrammarCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      structure: structure ?? this.structure,
      define: define ?? this.define,
      examples: examples ?? this.examples,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (structure.present) {
      map['structure'] = Variable<String>(structure.value);
    }
    if (define.present) {
      map['define'] = Variable<String>(define.value);
    }
    if (examples.present) {
      map['examples'] = Variable<String>(examples.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<int>(favorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GrammarCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('structure: $structure, ')
          ..write('define: $define, ')
          ..write('examples: $examples, ')
          ..write('favorite: $favorite')
          ..write(')'))
        .toString();
  }
}

class $GrammarTable extends Grammar with TableInfo<$GrammarTable, GrammarData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GrammarTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _structureMeta = const VerificationMeta('structure');
  @override
  late final GeneratedColumn<String?> structure = GeneratedColumn<String?>(
      'structure', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _defineMeta = const VerificationMeta('define');
  @override
  late final GeneratedColumn<String?> define = GeneratedColumn<String?>(
      'define', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _examplesMeta = const VerificationMeta('examples');
  @override
  late final GeneratedColumn<String?> examples = GeneratedColumn<String?>(
      'examples', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<int?> favorite = GeneratedColumn<int?>(
      'favorite', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, structure, define, examples, favorite];
  @override
  String get aliasedName => _alias ?? 'grammar';
  @override
  String get actualTableName => 'grammar';
  @override
  VerificationContext validateIntegrity(Insertable<GrammarData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('structure')) {
      context.handle(_structureMeta,
          structure.isAcceptableOrUnknown(data['structure']!, _structureMeta));
    } else if (isInserting) {
      context.missing(_structureMeta);
    }
    if (data.containsKey('define')) {
      context.handle(_defineMeta,
          define.isAcceptableOrUnknown(data['define']!, _defineMeta));
    } else if (isInserting) {
      context.missing(_defineMeta);
    }
    if (data.containsKey('examples')) {
      context.handle(_examplesMeta,
          examples.isAcceptableOrUnknown(data['examples']!, _examplesMeta));
    } else if (isInserting) {
      context.missing(_examplesMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    } else if (isInserting) {
      context.missing(_favoriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GrammarData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GrammarData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GrammarTable createAlias(String alias) {
    return $GrammarTable(attachedDatabase, alias);
  }
}

class Idiom extends DataClass implements Insertable<Idiom> {
  final int id;
  final String sentence;
  final String meaning;
  final int favorite;
  Idiom(
      {required this.id,
      required this.sentence,
      required this.meaning,
      required this.favorite});
  factory Idiom.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Idiom(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      sentence: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sentence'])!,
      meaning: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meaning'])!,
      favorite: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sentence'] = Variable<String>(sentence);
    map['meaning'] = Variable<String>(meaning);
    map['favorite'] = Variable<int>(favorite);
    return map;
  }

  IdiomsCompanion toCompanion(bool nullToAbsent) {
    return IdiomsCompanion(
      id: Value(id),
      sentence: Value(sentence),
      meaning: Value(meaning),
      favorite: Value(favorite),
    );
  }

  factory Idiom.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Idiom(
      id: serializer.fromJson<int>(json['id']),
      sentence: serializer.fromJson<String>(json['sentence']),
      meaning: serializer.fromJson<String>(json['meaning']),
      favorite: serializer.fromJson<int>(json['favorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sentence': serializer.toJson<String>(sentence),
      'meaning': serializer.toJson<String>(meaning),
      'favorite': serializer.toJson<int>(favorite),
    };
  }

  Idiom copyWith({int? id, String? sentence, String? meaning, int? favorite}) =>
      Idiom(
        id: id ?? this.id,
        sentence: sentence ?? this.sentence,
        meaning: meaning ?? this.meaning,
        favorite: favorite ?? this.favorite,
      );
  @override
  String toString() {
    return (StringBuffer('Idiom(')
          ..write('id: $id, ')
          ..write('sentence: $sentence, ')
          ..write('meaning: $meaning, ')
          ..write('favorite: $favorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sentence, meaning, favorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Idiom &&
          other.id == this.id &&
          other.sentence == this.sentence &&
          other.meaning == this.meaning &&
          other.favorite == this.favorite);
}

class IdiomsCompanion extends UpdateCompanion<Idiom> {
  final Value<int> id;
  final Value<String> sentence;
  final Value<String> meaning;
  final Value<int> favorite;
  const IdiomsCompanion({
    this.id = const Value.absent(),
    this.sentence = const Value.absent(),
    this.meaning = const Value.absent(),
    this.favorite = const Value.absent(),
  });
  IdiomsCompanion.insert({
    this.id = const Value.absent(),
    required String sentence,
    required String meaning,
    required int favorite,
  })  : sentence = Value(sentence),
        meaning = Value(meaning),
        favorite = Value(favorite);
  static Insertable<Idiom> custom({
    Expression<int>? id,
    Expression<String>? sentence,
    Expression<String>? meaning,
    Expression<int>? favorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sentence != null) 'sentence': sentence,
      if (meaning != null) 'meaning': meaning,
      if (favorite != null) 'favorite': favorite,
    });
  }

  IdiomsCompanion copyWith(
      {Value<int>? id,
      Value<String>? sentence,
      Value<String>? meaning,
      Value<int>? favorite}) {
    return IdiomsCompanion(
      id: id ?? this.id,
      sentence: sentence ?? this.sentence,
      meaning: meaning ?? this.meaning,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sentence.present) {
      map['sentence'] = Variable<String>(sentence.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<int>(favorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IdiomsCompanion(')
          ..write('id: $id, ')
          ..write('sentence: $sentence, ')
          ..write('meaning: $meaning, ')
          ..write('favorite: $favorite')
          ..write(')'))
        .toString();
  }
}

class $IdiomsTable extends Idioms with TableInfo<$IdiomsTable, Idiom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IdiomsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _sentenceMeta = const VerificationMeta('sentence');
  @override
  late final GeneratedColumn<String?> sentence = GeneratedColumn<String?>(
      'sentence', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _meaningMeta = const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String?> meaning = GeneratedColumn<String?>(
      'meaning', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<int?> favorite = GeneratedColumn<int?>(
      'favorite', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, sentence, meaning, favorite];
  @override
  String get aliasedName => _alias ?? 'idioms';
  @override
  String get actualTableName => 'idioms';
  @override
  VerificationContext validateIntegrity(Insertable<Idiom> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sentence')) {
      context.handle(_sentenceMeta,
          sentence.isAcceptableOrUnknown(data['sentence']!, _sentenceMeta));
    } else if (isInserting) {
      context.missing(_sentenceMeta);
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    } else if (isInserting) {
      context.missing(_favoriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Idiom map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Idiom.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IdiomsTable createAlias(String alias) {
    return $IdiomsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $VATable va = $VATable(this);
  late final $AVTable av = $AVTable(this);
  late final $GrammarTable grammar = $GrammarTable(this);
  late final $IdiomsTable idioms = $IdiomsTable(this);
  late final DictionaryDao dictionaryDao = DictionaryDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [va, av, grammar, idioms];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$DictionaryDaoMixin on DatabaseAccessor<AppDatabase> {
  $VATable get va => attachedDatabase.va;
  $AVTable get av => attachedDatabase.av;
  $GrammarTable get grammar => attachedDatabase.grammar;
  $IdiomsTable get idioms => attachedDatabase.idioms;
  Future<int> addFavoriteGrammar(int var1) {
    return customUpdate(
      'UPDATE grammar SET favorite = 1 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {grammar},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> addFavoriteWordAV(int var1) {
    return customUpdate(
      'UPDATE av SET favorite = 1 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {av},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> addFavoriteWordVA(int var1) {
    return customUpdate(
      'UPDATE va SET favorite = 1 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {va},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> addFavoriteIdioms(int var1) {
    return customUpdate(
      'UPDATE idioms SET favorite = 1 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {idioms},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> removeFavoriteGrammar(int var1) {
    return customUpdate(
      'UPDATE grammar SET favorite = 0 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {grammar},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> removeFavoriteWordAV(int var1) {
    return customUpdate(
      'UPDATE av SET favorite = 0 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {av},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> removeFavoriteIdioms(int var1) {
    return customUpdate(
      'UPDATE idioms SET favorite = 0 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {idioms},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> removeFavoriteWordVA(int var1) {
    return customUpdate(
      'UPDATE va SET favorite = 0 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {va},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> historySearchAV(int var1) {
    return customUpdate(
      'UPDATE av SET history = 1 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {av},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> historySearchVA(int var1) {
    return customUpdate(
      'UPDATE va SET history = 1 WHERE id = ?',
      variables: [Variable<int>(var1)],
      updates: {va},
      updateKind: UpdateKind.update,
    );
  }
}
