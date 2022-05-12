// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

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
  VAData(
      {required this.id,
      required this.word,
      required this.html,
      required this.description,
      required this.pronounce});
  static List<VAData> historyVA = [];
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
    return map;
  }

  VACompanion toCompanion(bool nullToAbsent) {
    return VACompanion(
      id: Value(id),
      word: Value(word),
      html: Value(html),
      description: Value(description),
      pronounce: Value(pronounce),
    );
  }

  factory VAData.fromJson(Map<String, dynamic> json,) {
    return VAData(
      id: json['id'],
      word: json['word'],
      html: json['html'],
      description: json['description'],
      pronounce: json['pronounce'],
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
    };
  }

  VAData copyWith(
          {int? id,
          String? word,
          String? html,
          String? description,
          String? pronounce}) =>
      VAData(
        id: id ?? this.id,
        word: word ?? this.word,
        html: html ?? this.html,
        description: description ?? this.description,
        pronounce: pronounce ?? this.pronounce,
      );
  @override
  String toString() {
    return (StringBuffer('VAData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('html: $html, ')
          ..write('description: $description, ')
          ..write('pronounce: $pronounce')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, html, description, pronounce);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VAData &&
          other.id == this.id &&
          other.word == this.word &&
          other.html == this.html &&
          other.description == this.description &&
          other.pronounce == this.pronounce);
}

class VACompanion extends UpdateCompanion<VAData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> html;
  final Value<String> description;
  final Value<String> pronounce;
  const VACompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.html = const Value.absent(),
    this.description = const Value.absent(),
    this.pronounce = const Value.absent(),
  });
  VACompanion.insert({
    required int id,
    required String word,
    required String html,
    required String description,
    required String pronounce,
  })  : id = Value(id),
        word = Value(word),
        html = Value(html),
        description = Value(description),
        pronounce = Value(pronounce);
  static Insertable<VAData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? html,
    Expression<String>? description,
    Expression<String>? pronounce,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (html != null) 'html': html,
      if (description != null) 'description': description,
      if (pronounce != null) 'pronounce': pronounce,
    });
  }

  VACompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? html,
      Value<String>? description,
      Value<String>? pronounce}) {
    return VACompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      html: html ?? this.html,
      description: description ?? this.description,
      pronounce: pronounce ?? this.pronounce,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VACompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('html: $html, ')
          ..write('description: $description, ')
          ..write('pronounce: $pronounce')
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, word, html, description, pronounce];
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
  AVData(
      {required this.id,
      required this.word,
      required this.html,
      required this.description,
      required this.pronounce});
  static List<AVData> historyAV = [];
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
    return map;
  }

  AVCompanion toCompanion(bool nullToAbsent) {
    return AVCompanion(
      id: Value(id),
      word: Value(word),
      html: Value(html),
      description: Value(description),
      pronounce: Value(pronounce),
    );
  }

  factory AVData.fromJson(
      Map<String, dynamic> json) {
    return AVData(
      id: json['id'],
      word: json['word'],
      html: json['html'],
      description: json['description'],
      pronounce: json['pronounce'],
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
    };
  }

  AVData copyWith(
          {int? id,
          String? word,
          String? html,
          String? description,
          String? pronounce}) =>
      AVData(
        id: id ?? this.id,
        word: word ?? this.word,
        html: html ?? this.html,
        description: description ?? this.description,
        pronounce: pronounce ?? this.pronounce,
      );
  @override
  String toString() {
    return (StringBuffer('AVData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('html: $html, ')
          ..write('description: $description, ')
          ..write('pronounce: $pronounce')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, html, description, pronounce);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AVData &&
          other.id == this.id &&
          other.word == this.word &&
          other.html == this.html &&
          other.description == this.description &&
          other.pronounce == this.pronounce);
}

class AVCompanion extends UpdateCompanion<AVData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> html;
  final Value<String> description;
  final Value<String> pronounce;
  const AVCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.html = const Value.absent(),
    this.description = const Value.absent(),
    this.pronounce = const Value.absent(),
  });
  AVCompanion.insert({
    required int id,
    required String word,
    required String html,
    required String description,
    required String pronounce,
  })  : id = Value(id),
        word = Value(word),
        html = Value(html),
        description = Value(description),
        pronounce = Value(pronounce);
  static Insertable<AVData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? html,
    Expression<String>? description,
    Expression<String>? pronounce,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (html != null) 'html': html,
      if (description != null) 'description': description,
      if (pronounce != null) 'pronounce': pronounce,
    });
  }

  AVCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? html,
      Value<String>? description,
      Value<String>? pronounce}) {
    return AVCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      html: html ?? this.html,
      description: description ?? this.description,
      pronounce: pronounce ?? this.pronounce,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AVCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('html: $html, ')
          ..write('description: $description, ')
          ..write('pronounce: $pronounce')
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, word, html, description, pronounce];
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
  GrammarData(
      {required this.id,
      required this.title,
      required this.structure,
      required this.define,
      required this.examples});
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
    return map;
  }

  GrammarCompanion toCompanion(bool nullToAbsent) {
    return GrammarCompanion(
      id: Value(id),
      title: Value(title),
      structure: Value(structure),
      define: Value(define),
      examples: Value(examples),
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
    };
  }

  GrammarData copyWith(
          {int? id,
          String? title,
          String? structure,
          String? define,
          String? examples}) =>
      GrammarData(
        id: id ?? this.id,
        title: title ?? this.title,
        structure: structure ?? this.structure,
        define: define ?? this.define,
        examples: examples ?? this.examples,
      );
  @override
  String toString() {
    return (StringBuffer('GrammarData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('structure: $structure, ')
          ..write('define: $define, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, structure, define, examples);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GrammarData &&
          other.id == this.id &&
          other.title == this.title &&
          other.structure == this.structure &&
          other.define == this.define &&
          other.examples == this.examples);
}

class GrammarCompanion extends UpdateCompanion<GrammarData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> structure;
  final Value<String> define;
  final Value<String> examples;
  const GrammarCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.structure = const Value.absent(),
    this.define = const Value.absent(),
    this.examples = const Value.absent(),
  });
  GrammarCompanion.insert({
    required int id,
    required String title,
    required String structure,
    required String define,
    required String examples,
  })  : id = Value(id),
        title = Value(title),
        structure = Value(structure),
        define = Value(define),
        examples = Value(examples);
  static Insertable<GrammarData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? structure,
    Expression<String>? define,
    Expression<String>? examples,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (structure != null) 'structure': structure,
      if (define != null) 'define': define,
      if (examples != null) 'examples': examples,
    });
  }

  GrammarCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? structure,
      Value<String>? define,
      Value<String>? examples}) {
    return GrammarCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      structure: structure ?? this.structure,
      define: define ?? this.define,
      examples: examples ?? this.examples,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GrammarCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('structure: $structure, ')
          ..write('define: $define, ')
          ..write('examples: $examples')
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
      type: const IntType(), requiredDuringInsert: true);
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, structure, define, examples];
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
    } else if (isInserting) {
      context.missing(_idMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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

class ConversationData extends DataClass
    implements Insertable<ConversationData> {
  final int id;
  final String name;
  final String content;
  final String image;
  final String audio;
  ConversationData(
      {required this.id,
      required this.name,
      required this.content,
      required this.image,
      required this.audio});
  factory ConversationData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ConversationData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      audio: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audio'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['content'] = Variable<String>(content);
    map['image'] = Variable<String>(image);
    map['audio'] = Variable<String>(audio);
    return map;
  }

  ConversationCompanion toCompanion(bool nullToAbsent) {
    return ConversationCompanion(
      id: Value(id),
      name: Value(name),
      content: Value(content),
      image: Value(image),
      audio: Value(audio),
    );
  }

  factory ConversationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConversationData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      content: serializer.fromJson<String>(json['content']),
      image: serializer.fromJson<String>(json['image']),
      audio: serializer.fromJson<String>(json['audio']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'content': serializer.toJson<String>(content),
      'image': serializer.toJson<String>(image),
      'audio': serializer.toJson<String>(audio),
    };
  }

  ConversationData copyWith(
          {int? id,
          String? name,
          String? content,
          String? image,
          String? audio}) =>
      ConversationData(
        id: id ?? this.id,
        name: name ?? this.name,
        content: content ?? this.content,
        image: image ?? this.image,
        audio: audio ?? this.audio,
      );
  @override
  String toString() {
    return (StringBuffer('ConversationData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('content: $content, ')
          ..write('image: $image, ')
          ..write('audio: $audio')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, content, image, audio);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConversationData &&
          other.id == this.id &&
          other.name == this.name &&
          other.content == this.content &&
          other.image == this.image &&
          other.audio == this.audio);
}

class ConversationCompanion extends UpdateCompanion<ConversationData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> content;
  final Value<String> image;
  final Value<String> audio;
  const ConversationCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.content = const Value.absent(),
    this.image = const Value.absent(),
    this.audio = const Value.absent(),
  });
  ConversationCompanion.insert({
    required int id,
    required String name,
    required String content,
    required String image,
    required String audio,
  })  : id = Value(id),
        name = Value(name),
        content = Value(content),
        image = Value(image),
        audio = Value(audio);
  static Insertable<ConversationData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? content,
    Expression<String>? image,
    Expression<String>? audio,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (content != null) 'content': content,
      if (image != null) 'image': image,
      if (audio != null) 'audio': audio,
    });
  }

  ConversationCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? content,
      Value<String>? image,
      Value<String>? audio}) {
    return ConversationCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      image: image ?? this.image,
      audio: audio ?? this.audio,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (audio.present) {
      map['audio'] = Variable<String>(audio.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('content: $content, ')
          ..write('image: $image, ')
          ..write('audio: $audio')
          ..write(')'))
        .toString();
  }
}

class $ConversationTable extends Conversation
    with TableInfo<$ConversationTable, ConversationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversationTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _audioMeta = const VerificationMeta('audio');
  @override
  late final GeneratedColumn<String?> audio = GeneratedColumn<String?>(
      'audio', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, content, image, audio];
  @override
  String get aliasedName => _alias ?? 'conversation';
  @override
  String get actualTableName => 'conversation';
  @override
  VerificationContext validateIntegrity(Insertable<ConversationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('audio')) {
      context.handle(
          _audioMeta, audio.isAcceptableOrUnknown(data['audio']!, _audioMeta));
    } else if (isInserting) {
      context.missing(_audioMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ConversationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ConversationData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ConversationTable createAlias(String alias) {
    return $ConversationTable(attachedDatabase, alias);
  }
}

class Idiom extends DataClass implements Insertable<Idiom> {
  final int id;
  final String sentence;
  final String meaning;
  Idiom({required this.id, required this.sentence, required this.meaning});
  factory Idiom.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Idiom(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      sentence: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sentence'])!,
      meaning: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meaning'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sentence'] = Variable<String>(sentence);
    map['meaning'] = Variable<String>(meaning);
    return map;
  }

  IdiomsCompanion toCompanion(bool nullToAbsent) {
    return IdiomsCompanion(
      id: Value(id),
      sentence: Value(sentence),
      meaning: Value(meaning),
    );
  }

  factory Idiom.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Idiom(
      id: serializer.fromJson<int>(json['id']),
      sentence: serializer.fromJson<String>(json['sentence']),
      meaning: serializer.fromJson<String>(json['meaning']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sentence': serializer.toJson<String>(sentence),
      'meaning': serializer.toJson<String>(meaning),
    };
  }

  Idiom copyWith({int? id, String? sentence, String? meaning}) => Idiom(
        id: id ?? this.id,
        sentence: sentence ?? this.sentence,
        meaning: meaning ?? this.meaning,
      );
  @override
  String toString() {
    return (StringBuffer('Idiom(')
          ..write('id: $id, ')
          ..write('sentence: $sentence, ')
          ..write('meaning: $meaning')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sentence, meaning);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Idiom &&
          other.id == this.id &&
          other.sentence == this.sentence &&
          other.meaning == this.meaning);
}

class IdiomsCompanion extends UpdateCompanion<Idiom> {
  final Value<int> id;
  final Value<String> sentence;
  final Value<String> meaning;
  const IdiomsCompanion({
    this.id = const Value.absent(),
    this.sentence = const Value.absent(),
    this.meaning = const Value.absent(),
  });
  IdiomsCompanion.insert({
    required int id,
    required String sentence,
    required String meaning,
  })  : id = Value(id),
        sentence = Value(sentence),
        meaning = Value(meaning);
  static Insertable<Idiom> custom({
    Expression<int>? id,
    Expression<String>? sentence,
    Expression<String>? meaning,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sentence != null) 'sentence': sentence,
      if (meaning != null) 'meaning': meaning,
    });
  }

  IdiomsCompanion copyWith(
      {Value<int>? id, Value<String>? sentence, Value<String>? meaning}) {
    return IdiomsCompanion(
      id: id ?? this.id,
      sentence: sentence ?? this.sentence,
      meaning: meaning ?? this.meaning,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IdiomsCompanion(')
          ..write('id: $id, ')
          ..write('sentence: $sentence, ')
          ..write('meaning: $meaning')
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
      type: const IntType(), requiredDuringInsert: true);
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
  @override
  List<GeneratedColumn> get $columns => [id, sentence, meaning];
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
    } else if (isInserting) {
      context.missing(_idMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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

class Short_StoryData extends DataClass implements Insertable<Short_StoryData> {
  final int id;
  final String title;
  final String story;
  final String image;
  Short_StoryData(
      {required this.id,
      required this.title,
      required this.story,
      required this.image});
  factory Short_StoryData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Short_StoryData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      story: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}story'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['story'] = Variable<String>(story);
    map['image'] = Variable<String>(image);
    return map;
  }

  Short_StoryCompanion toCompanion(bool nullToAbsent) {
    return Short_StoryCompanion(
      id: Value(id),
      title: Value(title),
      story: Value(story),
      image: Value(image),
    );
  }

  factory Short_StoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Short_StoryData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      story: serializer.fromJson<String>(json['story']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'story': serializer.toJson<String>(story),
      'image': serializer.toJson<String>(image),
    };
  }

  Short_StoryData copyWith(
          {int? id, String? title, String? story, String? image}) =>
      Short_StoryData(
        id: id ?? this.id,
        title: title ?? this.title,
        story: story ?? this.story,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('Short_StoryData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('story: $story, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, story, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Short_StoryData &&
          other.id == this.id &&
          other.title == this.title &&
          other.story == this.story &&
          other.image == this.image);
}

class Short_StoryCompanion extends UpdateCompanion<Short_StoryData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> story;
  final Value<String> image;
  const Short_StoryCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.story = const Value.absent(),
    this.image = const Value.absent(),
  });
  Short_StoryCompanion.insert({
    required int id,
    required String title,
    required String story,
    required String image,
  })  : id = Value(id),
        title = Value(title),
        story = Value(story),
        image = Value(image);
  static Insertable<Short_StoryData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? story,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (story != null) 'story': story,
      if (image != null) 'image': image,
    });
  }

  Short_StoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? story,
      Value<String>? image}) {
    return Short_StoryCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      story: story ?? this.story,
      image: image ?? this.image,
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
    if (story.present) {
      map['story'] = Variable<String>(story.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('Short_StoryCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('story: $story, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $Short_StoryTable extends Short_Story
    with TableInfo<$Short_StoryTable, Short_StoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $Short_StoryTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _storyMeta = const VerificationMeta('story');
  @override
  late final GeneratedColumn<String?> story = GeneratedColumn<String?>(
      'story', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, story, image];
  @override
  String get aliasedName => _alias ?? 'short_story';
  @override
  String get actualTableName => 'short_story';
  @override
  VerificationContext validateIntegrity(Insertable<Short_StoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('story')) {
      context.handle(
          _storyMeta, story.isAcceptableOrUnknown(data['story']!, _storyMeta));
    } else if (isInserting) {
      context.missing(_storyMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Short_StoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Short_StoryData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $Short_StoryTable createAlias(String alias) {
    return $Short_StoryTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $VATable va = $VATable(this);
  late final $AVTable av = $AVTable(this);
  late final $GrammarTable grammar = $GrammarTable(this);
  late final $ConversationTable conversation = $ConversationTable(this);
  late final $IdiomsTable idioms = $IdiomsTable(this);
  late final $Short_StoryTable shortStory = $Short_StoryTable(this);
  late final DictionaryDao dictionaryDao = DictionaryDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [va, av, grammar, conversation, idioms, shortStory];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$DictionaryDaoMixin on DatabaseAccessor<AppDatabase> {
  $VATable get va => attachedDatabase.va;
  $AVTable get av => attachedDatabase.av;
  $GrammarTable get grammar => attachedDatabase.grammar;
  $ConversationTable get conversation => attachedDatabase.conversation;
  $IdiomsTable get idioms => attachedDatabase.idioms;
  $Short_StoryTable get shortStory => attachedDatabase.shortStory;
}
