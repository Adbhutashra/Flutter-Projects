// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StudentTable extends Student with TableInfo<$StudentTable, StudentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rollnumberMeta =
      const VerificationMeta('rollnumber');
  @override
  late final GeneratedColumn<int> rollnumber = GeneratedColumn<int>(
      'rollnumber', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _studentNameMeta =
      const VerificationMeta('studentName');
  @override
  late final GeneratedColumn<String> studentName = GeneratedColumn<String>(
      'student_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, rollnumber, studentName];
  @override
  String get aliasedName => _alias ?? 'student';
  @override
  String get actualTableName => 'student';
  @override
  VerificationContext validateIntegrity(Insertable<StudentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('rollnumber')) {
      context.handle(
          _rollnumberMeta,
          rollnumber.isAcceptableOrUnknown(
              data['rollnumber']!, _rollnumberMeta));
    } else if (isInserting) {
      context.missing(_rollnumberMeta);
    }
    if (data.containsKey('student_name')) {
      context.handle(
          _studentNameMeta,
          studentName.isAcceptableOrUnknown(
              data['student_name']!, _studentNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StudentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rollnumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rollnumber'])!,
      studentName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}student_name']),
    );
  }

  @override
  $StudentTable createAlias(String alias) {
    return $StudentTable(attachedDatabase, alias);
  }
}

class StudentData extends DataClass implements Insertable<StudentData> {
  final int id;
  final int rollnumber;
  final String? studentName;
  const StudentData(
      {required this.id, required this.rollnumber, this.studentName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['rollnumber'] = Variable<int>(rollnumber);
    if (!nullToAbsent || studentName != null) {
      map['student_name'] = Variable<String>(studentName);
    }
    return map;
  }

  StudentCompanion toCompanion(bool nullToAbsent) {
    return StudentCompanion(
      id: Value(id),
      rollnumber: Value(rollnumber),
      studentName: studentName == null && nullToAbsent
          ? const Value.absent()
          : Value(studentName),
    );
  }

  factory StudentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentData(
      id: serializer.fromJson<int>(json['id']),
      rollnumber: serializer.fromJson<int>(json['rollnumber']),
      studentName: serializer.fromJson<String?>(json['studentName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rollnumber': serializer.toJson<int>(rollnumber),
      'studentName': serializer.toJson<String?>(studentName),
    };
  }

  StudentData copyWith(
          {int? id,
          int? rollnumber,
          Value<String?> studentName = const Value.absent()}) =>
      StudentData(
        id: id ?? this.id,
        rollnumber: rollnumber ?? this.rollnumber,
        studentName: studentName.present ? studentName.value : this.studentName,
      );
  @override
  String toString() {
    return (StringBuffer('StudentData(')
          ..write('id: $id, ')
          ..write('rollnumber: $rollnumber, ')
          ..write('studentName: $studentName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, rollnumber, studentName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentData &&
          other.id == this.id &&
          other.rollnumber == this.rollnumber &&
          other.studentName == this.studentName);
}

class StudentCompanion extends UpdateCompanion<StudentData> {
  final Value<int> id;
  final Value<int> rollnumber;
  final Value<String?> studentName;
  final Value<int> rowid;
  const StudentCompanion({
    this.id = const Value.absent(),
    this.rollnumber = const Value.absent(),
    this.studentName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentCompanion.insert({
    required int id,
    required int rollnumber,
    this.studentName = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        rollnumber = Value(rollnumber);
  static Insertable<StudentData> custom({
    Expression<int>? id,
    Expression<int>? rollnumber,
    Expression<String>? studentName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rollnumber != null) 'rollnumber': rollnumber,
      if (studentName != null) 'student_name': studentName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentCompanion copyWith(
      {Value<int>? id,
      Value<int>? rollnumber,
      Value<String?>? studentName,
      Value<int>? rowid}) {
    return StudentCompanion(
      id: id ?? this.id,
      rollnumber: rollnumber ?? this.rollnumber,
      studentName: studentName ?? this.studentName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rollnumber.present) {
      map['rollnumber'] = Variable<int>(rollnumber.value);
    }
    if (studentName.present) {
      map['student_name'] = Variable<String>(studentName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentCompanion(')
          ..write('id: $id, ')
          ..write('rollnumber: $rollnumber, ')
          ..write('studentName: $studentName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $StudentTable student = $StudentTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [student];
}
