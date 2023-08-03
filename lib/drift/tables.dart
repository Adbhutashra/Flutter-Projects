import 'package:drift/drift.dart';

class Student extends Table{
    IntColumn get id => integer()();

  IntColumn get rollnumber => integer()();

  TextColumn get studentName => text().nullable()();
}