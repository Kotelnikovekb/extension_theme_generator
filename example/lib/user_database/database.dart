import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';


part 'database.g.dart';

@DriftDatabase(tables: [DebtEntity])
class MainDatabase extends _$MainDatabase{
  MainDatabase(): super(_openConnection());

  @override
  int get schemaVersion => 1;


}

class DebtEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'myDebts.sqlite'));
    return NativeDatabase(file);
  });
}