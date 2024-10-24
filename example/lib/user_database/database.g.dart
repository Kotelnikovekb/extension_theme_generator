// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DebtEntityTable extends DebtEntity
    with TableInfo<$DebtEntityTable, DebtEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DebtEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'debt_entity';
  @override
  VerificationContext validateIntegrity(Insertable<DebtEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DebtEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DebtEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $DebtEntityTable createAlias(String alias) {
    return $DebtEntityTable(attachedDatabase, alias);
  }
}

class DebtEntityData extends DataClass implements Insertable<DebtEntityData> {
  final int id;
  final String description;
  const DebtEntityData({required this.id, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    return map;
  }

  DebtEntityCompanion toCompanion(bool nullToAbsent) {
    return DebtEntityCompanion(
      id: Value(id),
      description: Value(description),
    );
  }

  factory DebtEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DebtEntityData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  DebtEntityData copyWith({int? id, String? description}) => DebtEntityData(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  DebtEntityData copyWithCompanion(DebtEntityCompanion data) {
    return DebtEntityData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DebtEntityData(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DebtEntityData &&
          other.id == this.id &&
          other.description == this.description);
}

class DebtEntityCompanion extends UpdateCompanion<DebtEntityData> {
  final Value<int> id;
  final Value<String> description;
  const DebtEntityCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
  });
  DebtEntityCompanion.insert({
    this.id = const Value.absent(),
    required String description,
  }) : description = Value(description);
  static Insertable<DebtEntityData> custom({
    Expression<int>? id,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
    });
  }

  DebtEntityCompanion copyWith({Value<int>? id, Value<String>? description}) {
    return DebtEntityCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DebtEntityCompanion(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$MainDatabase extends GeneratedDatabase {
  _$MainDatabase(QueryExecutor e) : super(e);
  $MainDatabaseManager get managers => $MainDatabaseManager(this);
  late final $DebtEntityTable debtEntity = $DebtEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [debtEntity];
}

typedef $$DebtEntityTableCreateCompanionBuilder = DebtEntityCompanion Function({
  Value<int> id,
  required String description,
});
typedef $$DebtEntityTableUpdateCompanionBuilder = DebtEntityCompanion Function({
  Value<int> id,
  Value<String> description,
});

class $$DebtEntityTableFilterComposer
    extends Composer<_$MainDatabase, $DebtEntityTable> {
  $$DebtEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$DebtEntityTableOrderingComposer
    extends Composer<_$MainDatabase, $DebtEntityTable> {
  $$DebtEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$DebtEntityTableAnnotationComposer
    extends Composer<_$MainDatabase, $DebtEntityTable> {
  $$DebtEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$DebtEntityTableTableManager extends RootTableManager<
    _$MainDatabase,
    $DebtEntityTable,
    DebtEntityData,
    $$DebtEntityTableFilterComposer,
    $$DebtEntityTableOrderingComposer,
    $$DebtEntityTableAnnotationComposer,
    $$DebtEntityTableCreateCompanionBuilder,
    $$DebtEntityTableUpdateCompanionBuilder,
    (
      DebtEntityData,
      BaseReferences<_$MainDatabase, $DebtEntityTable, DebtEntityData>
    ),
    DebtEntityData,
    PrefetchHooks Function()> {
  $$DebtEntityTableTableManager(_$MainDatabase db, $DebtEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DebtEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DebtEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DebtEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) =>
              DebtEntityCompanion(
            id: id,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
          }) =>
              DebtEntityCompanion.insert(
            id: id,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DebtEntityTableProcessedTableManager = ProcessedTableManager<
    _$MainDatabase,
    $DebtEntityTable,
    DebtEntityData,
    $$DebtEntityTableFilterComposer,
    $$DebtEntityTableOrderingComposer,
    $$DebtEntityTableAnnotationComposer,
    $$DebtEntityTableCreateCompanionBuilder,
    $$DebtEntityTableUpdateCompanionBuilder,
    (
      DebtEntityData,
      BaseReferences<_$MainDatabase, $DebtEntityTable, DebtEntityData>
    ),
    DebtEntityData,
    PrefetchHooks Function()>;

class $MainDatabaseManager {
  final _$MainDatabase _db;
  $MainDatabaseManager(this._db);
  $$DebtEntityTableTableManager get debtEntity =>
      $$DebtEntityTableTableManager(_db, _db.debtEntity);
}
