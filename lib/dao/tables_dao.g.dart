// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables_dao.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Affair extends DataClass implements Insertable<Affair> {
  final int id;
  final int icon;
  final int color;
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final int category;
  final String remark;
  final int checked;
  Affair(
      {@required this.id,
      @required this.icon,
      @required this.color,
      @required this.name,
      @required this.startTime,
      @required this.endTime,
      @required this.category,
      @required this.remark,
      @required this.checked});
  factory Affair.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Affair(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      icon: intType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      startTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_time']),
      endTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_time']),
      category:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}category']),
      remark:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}remark']),
      checked:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}checked']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<int>(icon);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    if (!nullToAbsent || checked != null) {
      map['checked'] = Variable<int>(checked);
    }
    return map;
  }

  AffairsCompanion toCompanion(bool nullToAbsent) {
    return AffairsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      remark:
          remark == null && nullToAbsent ? const Value.absent() : Value(remark),
      checked: checked == null && nullToAbsent
          ? const Value.absent()
          : Value(checked),
    );
  }

  factory Affair.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Affair(
      id: serializer.fromJson<int>(json['id']),
      icon: serializer.fromJson<int>(json['icon']),
      color: serializer.fromJson<int>(json['color']),
      name: serializer.fromJson<String>(json['name']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      category: serializer.fromJson<int>(json['category']),
      remark: serializer.fromJson<String>(json['remark']),
      checked: serializer.fromJson<int>(json['checked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'icon': serializer.toJson<int>(icon),
      'color': serializer.toJson<int>(color),
      'name': serializer.toJson<String>(name),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'category': serializer.toJson<int>(category),
      'remark': serializer.toJson<String>(remark),
      'checked': serializer.toJson<int>(checked),
    };
  }

  Affair copyWith(
          {int id,
          int icon,
          int color,
          String name,
          DateTime startTime,
          DateTime endTime,
          int category,
          String remark,
          int checked}) =>
      Affair(
        id: id ?? this.id,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        name: name ?? this.name,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        category: category ?? this.category,
        remark: remark ?? this.remark,
        checked: checked ?? this.checked,
      );
  @override
  String toString() {
    return (StringBuffer('Affair(')
          ..write('id: $id, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('category: $category, ')
          ..write('remark: $remark, ')
          ..write('checked: $checked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          icon.hashCode,
          $mrjc(
              color.hashCode,
              $mrjc(
                  name.hashCode,
                  $mrjc(
                      startTime.hashCode,
                      $mrjc(
                          endTime.hashCode,
                          $mrjc(category.hashCode,
                              $mrjc(remark.hashCode, checked.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Affair &&
          other.id == this.id &&
          other.icon == this.icon &&
          other.color == this.color &&
          other.name == this.name &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.category == this.category &&
          other.remark == this.remark &&
          other.checked == this.checked);
}

class AffairsCompanion extends UpdateCompanion<Affair> {
  final Value<int> id;
  final Value<int> icon;
  final Value<int> color;
  final Value<String> name;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<int> category;
  final Value<String> remark;
  final Value<int> checked;
  const AffairsCompanion({
    this.id = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.name = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.category = const Value.absent(),
    this.remark = const Value.absent(),
    this.checked = const Value.absent(),
  });
  AffairsCompanion.insert({
    this.id = const Value.absent(),
    @required int icon,
    @required int color,
    @required String name,
    @required DateTime startTime,
    @required DateTime endTime,
    @required int category,
    @required String remark,
    @required int checked,
  })  : icon = Value(icon),
        color = Value(color),
        name = Value(name),
        startTime = Value(startTime),
        endTime = Value(endTime),
        category = Value(category),
        remark = Value(remark),
        checked = Value(checked);
  static Insertable<Affair> custom({
    Expression<int> id,
    Expression<int> icon,
    Expression<int> color,
    Expression<String> name,
    Expression<DateTime> startTime,
    Expression<DateTime> endTime,
    Expression<int> category,
    Expression<String> remark,
    Expression<int> checked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
      if (name != null) 'name': name,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (category != null) 'category': category,
      if (remark != null) 'remark': remark,
      if (checked != null) 'checked': checked,
    });
  }

  AffairsCompanion copyWith(
      {Value<int> id,
      Value<int> icon,
      Value<int> color,
      Value<String> name,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<int> category,
      Value<String> remark,
      Value<int> checked}) {
    return AffairsCompanion(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      category: category ?? this.category,
      remark: remark ?? this.remark,
      checked: checked ?? this.checked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (checked.present) {
      map['checked'] = Variable<int>(checked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AffairsCompanion(')
          ..write('id: $id, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('category: $category, ')
          ..write('remark: $remark, ')
          ..write('checked: $checked')
          ..write(')'))
        .toString();
  }
}

class $AffairsTable extends Affairs with TableInfo<$AffairsTable, Affair> {
  final GeneratedDatabase _db;
  final String _alias;
  $AffairsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  GeneratedIntColumn _icon;
  @override
  GeneratedIntColumn get icon => _icon ??= _constructIcon();
  GeneratedIntColumn _constructIcon() {
    return GeneratedIntColumn(
      'icon',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _startTimeMeta = const VerificationMeta('startTime');
  GeneratedDateTimeColumn _startTime;
  @override
  GeneratedDateTimeColumn get startTime => _startTime ??= _constructStartTime();
  GeneratedDateTimeColumn _constructStartTime() {
    return GeneratedDateTimeColumn(
      'start_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _endTimeMeta = const VerificationMeta('endTime');
  GeneratedDateTimeColumn _endTime;
  @override
  GeneratedDateTimeColumn get endTime => _endTime ??= _constructEndTime();
  GeneratedDateTimeColumn _constructEndTime() {
    return GeneratedDateTimeColumn(
      'end_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedIntColumn _category;
  @override
  GeneratedIntColumn get category => _category ??= _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  GeneratedTextColumn _remark;
  @override
  GeneratedTextColumn get remark => _remark ??= _constructRemark();
  GeneratedTextColumn _constructRemark() {
    return GeneratedTextColumn(
      'remark',
      $tableName,
      false,
    );
  }

  final VerificationMeta _checkedMeta = const VerificationMeta('checked');
  GeneratedIntColumn _checked;
  @override
  GeneratedIntColumn get checked => _checked ??= _constructChecked();
  GeneratedIntColumn _constructChecked() {
    return GeneratedIntColumn(
      'checked',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, icon, color, name, startTime, endTime, category, remark, checked];
  @override
  $AffairsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'affairs';
  @override
  final String actualTableName = 'affairs';
  @override
  VerificationContext validateIntegrity(Insertable<Affair> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time'], _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time'], _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark'], _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    if (data.containsKey('checked')) {
      context.handle(_checkedMeta,
          checked.isAcceptableOrUnknown(data['checked'], _checkedMeta));
    } else if (isInserting) {
      context.missing(_checkedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Affair map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Affair.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AffairsTable createAlias(String alias) {
    return $AffairsTable(_db, alias);
  }
}

class CommonAffair extends DataClass implements Insertable<CommonAffair> {
  final int id;
  final int icon;
  final int color;
  final String name;
  final int category;
  final String remark;
  CommonAffair(
      {@required this.id,
      @required this.icon,
      @required this.color,
      @required this.name,
      @required this.category,
      @required this.remark});
  factory CommonAffair.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CommonAffair(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      icon: intType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      category:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}category']),
      remark:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}remark']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<int>(icon);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    return map;
  }

  CommonAffairsCompanion toCompanion(bool nullToAbsent) {
    return CommonAffairsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      remark:
          remark == null && nullToAbsent ? const Value.absent() : Value(remark),
    );
  }

  factory CommonAffair.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CommonAffair(
      id: serializer.fromJson<int>(json['id']),
      icon: serializer.fromJson<int>(json['icon']),
      color: serializer.fromJson<int>(json['color']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<int>(json['category']),
      remark: serializer.fromJson<String>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'icon': serializer.toJson<int>(icon),
      'color': serializer.toJson<int>(color),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<int>(category),
      'remark': serializer.toJson<String>(remark),
    };
  }

  CommonAffair copyWith(
          {int id,
          int icon,
          int color,
          String name,
          int category,
          String remark}) =>
      CommonAffair(
        id: id ?? this.id,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        name: name ?? this.name,
        category: category ?? this.category,
        remark: remark ?? this.remark,
      );
  @override
  String toString() {
    return (StringBuffer('CommonAffair(')
          ..write('id: $id, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          icon.hashCode,
          $mrjc(
              color.hashCode,
              $mrjc(
                  name.hashCode, $mrjc(category.hashCode, remark.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CommonAffair &&
          other.id == this.id &&
          other.icon == this.icon &&
          other.color == this.color &&
          other.name == this.name &&
          other.category == this.category &&
          other.remark == this.remark);
}

class CommonAffairsCompanion extends UpdateCompanion<CommonAffair> {
  final Value<int> id;
  final Value<int> icon;
  final Value<int> color;
  final Value<String> name;
  final Value<int> category;
  final Value<String> remark;
  const CommonAffairsCompanion({
    this.id = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.remark = const Value.absent(),
  });
  CommonAffairsCompanion.insert({
    this.id = const Value.absent(),
    @required int icon,
    @required int color,
    @required String name,
    @required int category,
    @required String remark,
  })  : icon = Value(icon),
        color = Value(color),
        name = Value(name),
        category = Value(category),
        remark = Value(remark);
  static Insertable<CommonAffair> custom({
    Expression<int> id,
    Expression<int> icon,
    Expression<int> color,
    Expression<String> name,
    Expression<int> category,
    Expression<String> remark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (remark != null) 'remark': remark,
    });
  }

  CommonAffairsCompanion copyWith(
      {Value<int> id,
      Value<int> icon,
      Value<int> color,
      Value<String> name,
      Value<int> category,
      Value<String> remark}) {
    return CommonAffairsCompanion(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      name: name ?? this.name,
      category: category ?? this.category,
      remark: remark ?? this.remark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommonAffairsCompanion(')
          ..write('id: $id, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $CommonAffairsTable extends CommonAffairs
    with TableInfo<$CommonAffairsTable, CommonAffair> {
  final GeneratedDatabase _db;
  final String _alias;
  $CommonAffairsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  GeneratedIntColumn _icon;
  @override
  GeneratedIntColumn get icon => _icon ??= _constructIcon();
  GeneratedIntColumn _constructIcon() {
    return GeneratedIntColumn(
      'icon',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedIntColumn _category;
  @override
  GeneratedIntColumn get category => _category ??= _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  GeneratedTextColumn _remark;
  @override
  GeneratedTextColumn get remark => _remark ??= _constructRemark();
  GeneratedTextColumn _constructRemark() {
    return GeneratedTextColumn(
      'remark',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, icon, color, name, category, remark];
  @override
  $CommonAffairsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'common_affairs';
  @override
  final String actualTableName = 'common_affairs';
  @override
  VerificationContext validateIntegrity(Insertable<CommonAffair> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark'], _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommonAffair map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CommonAffair.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CommonAffairsTable createAlias(String alias) {
    return $CommonAffairsTable(_db, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final int id;
  final String name;
  final int frequency;
  final int volumeType;
  final int volume;
  final int timeLimit;
  final DateTime startTime;
  final DateTime endTime;
  final String affairs;
  Goal(
      {@required this.id,
      @required this.name,
      @required this.frequency,
      @required this.volumeType,
      @required this.volume,
      @required this.timeLimit,
      @required this.startTime,
      @required this.endTime,
      @required this.affairs});
  factory Goal.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Goal(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      frequency:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}frequency']),
      volumeType: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}volume_type']),
      volume: intType.mapFromDatabaseResponse(data['${effectivePrefix}volume']),
      timeLimit:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}time_limit']),
      startTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_time']),
      endTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_time']),
      affairs:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}affairs']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || frequency != null) {
      map['frequency'] = Variable<int>(frequency);
    }
    if (!nullToAbsent || volumeType != null) {
      map['volume_type'] = Variable<int>(volumeType);
    }
    if (!nullToAbsent || volume != null) {
      map['volume'] = Variable<int>(volume);
    }
    if (!nullToAbsent || timeLimit != null) {
      map['time_limit'] = Variable<int>(timeLimit);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || affairs != null) {
      map['affairs'] = Variable<String>(affairs);
    }
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      frequency: frequency == null && nullToAbsent
          ? const Value.absent()
          : Value(frequency),
      volumeType: volumeType == null && nullToAbsent
          ? const Value.absent()
          : Value(volumeType),
      volume:
          volume == null && nullToAbsent ? const Value.absent() : Value(volume),
      timeLimit: timeLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(timeLimit),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      affairs: affairs == null && nullToAbsent
          ? const Value.absent()
          : Value(affairs),
    );
  }

  factory Goal.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      frequency: serializer.fromJson<int>(json['frequency']),
      volumeType: serializer.fromJson<int>(json['volumeType']),
      volume: serializer.fromJson<int>(json['volume']),
      timeLimit: serializer.fromJson<int>(json['timeLimit']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      affairs: serializer.fromJson<String>(json['affairs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'frequency': serializer.toJson<int>(frequency),
      'volumeType': serializer.toJson<int>(volumeType),
      'volume': serializer.toJson<int>(volume),
      'timeLimit': serializer.toJson<int>(timeLimit),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'affairs': serializer.toJson<String>(affairs),
    };
  }

  Goal copyWith(
          {int id,
          String name,
          int frequency,
          int volumeType,
          int volume,
          int timeLimit,
          DateTime startTime,
          DateTime endTime,
          String affairs}) =>
      Goal(
        id: id ?? this.id,
        name: name ?? this.name,
        frequency: frequency ?? this.frequency,
        volumeType: volumeType ?? this.volumeType,
        volume: volume ?? this.volume,
        timeLimit: timeLimit ?? this.timeLimit,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        affairs: affairs ?? this.affairs,
      );
  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('frequency: $frequency, ')
          ..write('volumeType: $volumeType, ')
          ..write('volume: $volume, ')
          ..write('timeLimit: $timeLimit, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('affairs: $affairs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              frequency.hashCode,
              $mrjc(
                  volumeType.hashCode,
                  $mrjc(
                      volume.hashCode,
                      $mrjc(
                          timeLimit.hashCode,
                          $mrjc(startTime.hashCode,
                              $mrjc(endTime.hashCode, affairs.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.name == this.name &&
          other.frequency == this.frequency &&
          other.volumeType == this.volumeType &&
          other.volume == this.volume &&
          other.timeLimit == this.timeLimit &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.affairs == this.affairs);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> frequency;
  final Value<int> volumeType;
  final Value<int> volume;
  final Value<int> timeLimit;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<String> affairs;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.frequency = const Value.absent(),
    this.volumeType = const Value.absent(),
    this.volume = const Value.absent(),
    this.timeLimit = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.affairs = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int frequency,
    @required int volumeType,
    @required int volume,
    @required int timeLimit,
    @required DateTime startTime,
    @required DateTime endTime,
    @required String affairs,
  })  : name = Value(name),
        frequency = Value(frequency),
        volumeType = Value(volumeType),
        volume = Value(volume),
        timeLimit = Value(timeLimit),
        startTime = Value(startTime),
        endTime = Value(endTime),
        affairs = Value(affairs);
  static Insertable<Goal> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> frequency,
    Expression<int> volumeType,
    Expression<int> volume,
    Expression<int> timeLimit,
    Expression<DateTime> startTime,
    Expression<DateTime> endTime,
    Expression<String> affairs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (frequency != null) 'frequency': frequency,
      if (volumeType != null) 'volume_type': volumeType,
      if (volume != null) 'volume': volume,
      if (timeLimit != null) 'time_limit': timeLimit,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (affairs != null) 'affairs': affairs,
    });
  }

  GoalsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> frequency,
      Value<int> volumeType,
      Value<int> volume,
      Value<int> timeLimit,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<String> affairs}) {
    return GoalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      frequency: frequency ?? this.frequency,
      volumeType: volumeType ?? this.volumeType,
      volume: volume ?? this.volume,
      timeLimit: timeLimit ?? this.timeLimit,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      affairs: affairs ?? this.affairs,
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
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (volumeType.present) {
      map['volume_type'] = Variable<int>(volumeType.value);
    }
    if (volume.present) {
      map['volume'] = Variable<int>(volume.value);
    }
    if (timeLimit.present) {
      map['time_limit'] = Variable<int>(timeLimit.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (affairs.present) {
      map['affairs'] = Variable<String>(affairs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('frequency: $frequency, ')
          ..write('volumeType: $volumeType, ')
          ..write('volume: $volume, ')
          ..write('timeLimit: $timeLimit, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('affairs: $affairs')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  final GeneratedDatabase _db;
  final String _alias;
  $GoalsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _frequencyMeta = const VerificationMeta('frequency');
  GeneratedIntColumn _frequency;
  @override
  GeneratedIntColumn get frequency => _frequency ??= _constructFrequency();
  GeneratedIntColumn _constructFrequency() {
    return GeneratedIntColumn(
      'frequency',
      $tableName,
      false,
    );
  }

  final VerificationMeta _volumeTypeMeta = const VerificationMeta('volumeType');
  GeneratedIntColumn _volumeType;
  @override
  GeneratedIntColumn get volumeType => _volumeType ??= _constructVolumeType();
  GeneratedIntColumn _constructVolumeType() {
    return GeneratedIntColumn(
      'volume_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _volumeMeta = const VerificationMeta('volume');
  GeneratedIntColumn _volume;
  @override
  GeneratedIntColumn get volume => _volume ??= _constructVolume();
  GeneratedIntColumn _constructVolume() {
    return GeneratedIntColumn(
      'volume',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeLimitMeta = const VerificationMeta('timeLimit');
  GeneratedIntColumn _timeLimit;
  @override
  GeneratedIntColumn get timeLimit => _timeLimit ??= _constructTimeLimit();
  GeneratedIntColumn _constructTimeLimit() {
    return GeneratedIntColumn(
      'time_limit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _startTimeMeta = const VerificationMeta('startTime');
  GeneratedDateTimeColumn _startTime;
  @override
  GeneratedDateTimeColumn get startTime => _startTime ??= _constructStartTime();
  GeneratedDateTimeColumn _constructStartTime() {
    return GeneratedDateTimeColumn(
      'start_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _endTimeMeta = const VerificationMeta('endTime');
  GeneratedDateTimeColumn _endTime;
  @override
  GeneratedDateTimeColumn get endTime => _endTime ??= _constructEndTime();
  GeneratedDateTimeColumn _constructEndTime() {
    return GeneratedDateTimeColumn(
      'end_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _affairsMeta = const VerificationMeta('affairs');
  GeneratedTextColumn _affairs;
  @override
  GeneratedTextColumn get affairs => _affairs ??= _constructAffairs();
  GeneratedTextColumn _constructAffairs() {
    return GeneratedTextColumn(
      'affairs',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        frequency,
        volumeType,
        volume,
        timeLimit,
        startTime,
        endTime,
        affairs
      ];
  @override
  $GoalsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'goals';
  @override
  final String actualTableName = 'goals';
  @override
  VerificationContext validateIntegrity(Insertable<Goal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency'], _frequencyMeta));
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('volume_type')) {
      context.handle(
          _volumeTypeMeta,
          volumeType.isAcceptableOrUnknown(
              data['volume_type'], _volumeTypeMeta));
    } else if (isInserting) {
      context.missing(_volumeTypeMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume'], _volumeMeta));
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('time_limit')) {
      context.handle(_timeLimitMeta,
          timeLimit.isAcceptableOrUnknown(data['time_limit'], _timeLimitMeta));
    } else if (isInserting) {
      context.missing(_timeLimitMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time'], _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time'], _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('affairs')) {
      context.handle(_affairsMeta,
          affairs.isAcceptableOrUnknown(data['affairs'], _affairsMeta));
    } else if (isInserting) {
      context.missing(_affairsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Goal.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(_db, alias);
  }
}

class Essay extends DataClass implements Insertable<Essay> {
  final int id;
  final String title;
  final String content;
  final String picture;
  final int affair;
  final DateTime time;
  final double WH;
  Essay(
      {@required this.id,
      @required this.title,
      @required this.content,
      @required this.picture,
      @required this.affair,
      @required this.time,
      @required this.WH});
  factory Essay.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Essay(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      picture:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}picture']),
      affair: intType.mapFromDatabaseResponse(data['${effectivePrefix}affair']),
      time:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}time']),
      WH: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}wh']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<String>(picture);
    }
    if (!nullToAbsent || affair != null) {
      map['affair'] = Variable<int>(affair);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<DateTime>(time);
    }
    if (!nullToAbsent || WH != null) {
      map['wh'] = Variable<double>(WH);
    }
    return map;
  }

  EssaysCompanion toCompanion(bool nullToAbsent) {
    return EssaysCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      affair:
          affair == null && nullToAbsent ? const Value.absent() : Value(affair),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      WH: WH == null && nullToAbsent ? const Value.absent() : Value(WH),
    );
  }

  factory Essay.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Essay(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      picture: serializer.fromJson<String>(json['picture']),
      affair: serializer.fromJson<int>(json['affair']),
      time: serializer.fromJson<DateTime>(json['time']),
      WH: serializer.fromJson<double>(json['WH']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'picture': serializer.toJson<String>(picture),
      'affair': serializer.toJson<int>(affair),
      'time': serializer.toJson<DateTime>(time),
      'WH': serializer.toJson<double>(WH),
    };
  }

  Essay copyWith(
          {int id,
          String title,
          String content,
          String picture,
          int affair,
          DateTime time,
          double WH}) =>
      Essay(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        picture: picture ?? this.picture,
        affair: affair ?? this.affair,
        time: time ?? this.time,
        WH: WH ?? this.WH,
      );
  @override
  String toString() {
    return (StringBuffer('Essay(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('picture: $picture, ')
          ..write('affair: $affair, ')
          ..write('time: $time, ')
          ..write('WH: $WH')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              content.hashCode,
              $mrjc(
                  picture.hashCode,
                  $mrjc(
                      affair.hashCode, $mrjc(time.hashCode, WH.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Essay &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.picture == this.picture &&
          other.affair == this.affair &&
          other.time == this.time &&
          other.WH == this.WH);
}

class EssaysCompanion extends UpdateCompanion<Essay> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String> picture;
  final Value<int> affair;
  final Value<DateTime> time;
  final Value<double> WH;
  const EssaysCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.picture = const Value.absent(),
    this.affair = const Value.absent(),
    this.time = const Value.absent(),
    this.WH = const Value.absent(),
  });
  EssaysCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String content,
    @required String picture,
    @required int affair,
    @required DateTime time,
    @required double WH,
  })  : title = Value(title),
        content = Value(content),
        picture = Value(picture),
        affair = Value(affair),
        time = Value(time),
        WH = Value(WH);
  static Insertable<Essay> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> content,
    Expression<String> picture,
    Expression<int> affair,
    Expression<DateTime> time,
    Expression<double> WH,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (picture != null) 'picture': picture,
      if (affair != null) 'affair': affair,
      if (time != null) 'time': time,
      if (WH != null) 'wh': WH,
    });
  }

  EssaysCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> content,
      Value<String> picture,
      Value<int> affair,
      Value<DateTime> time,
      Value<double> WH}) {
    return EssaysCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      picture: picture ?? this.picture,
      affair: affair ?? this.affair,
      time: time ?? this.time,
      WH: WH ?? this.WH,
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
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String>(picture.value);
    }
    if (affair.present) {
      map['affair'] = Variable<int>(affair.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (WH.present) {
      map['wh'] = Variable<double>(WH.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EssaysCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('picture: $picture, ')
          ..write('affair: $affair, ')
          ..write('time: $time, ')
          ..write('WH: $WH')
          ..write(')'))
        .toString();
  }
}

class $EssaysTable extends Essays with TableInfo<$EssaysTable, Essay> {
  final GeneratedDatabase _db;
  final String _alias;
  $EssaysTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pictureMeta = const VerificationMeta('picture');
  GeneratedTextColumn _picture;
  @override
  GeneratedTextColumn get picture => _picture ??= _constructPicture();
  GeneratedTextColumn _constructPicture() {
    return GeneratedTextColumn(
      'picture',
      $tableName,
      false,
    );
  }

  final VerificationMeta _affairMeta = const VerificationMeta('affair');
  GeneratedIntColumn _affair;
  @override
  GeneratedIntColumn get affair => _affair ??= _constructAffair();
  GeneratedIntColumn _constructAffair() {
    return GeneratedIntColumn(
      'affair',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedDateTimeColumn _time;
  @override
  GeneratedDateTimeColumn get time => _time ??= _constructTime();
  GeneratedDateTimeColumn _constructTime() {
    return GeneratedDateTimeColumn(
      'time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _WHMeta = const VerificationMeta('WH');
  GeneratedRealColumn _WH;
  @override
  GeneratedRealColumn get WH => _WH ??= _constructWh();
  GeneratedRealColumn _constructWh() {
    return GeneratedRealColumn(
      'wh',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, picture, affair, time, WH];
  @override
  $EssaysTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'essays';
  @override
  final String actualTableName = 'essays';
  @override
  VerificationContext validateIntegrity(Insertable<Essay> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content'], _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture'], _pictureMeta));
    } else if (isInserting) {
      context.missing(_pictureMeta);
    }
    if (data.containsKey('affair')) {
      context.handle(_affairMeta,
          affair.isAcceptableOrUnknown(data['affair'], _affairMeta));
    } else if (isInserting) {
      context.missing(_affairMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time'], _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('wh')) {
      context.handle(_WHMeta, WH.isAcceptableOrUnknown(data['wh'], _WHMeta));
    } else if (isInserting) {
      context.missing(_WHMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Essay map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Essay.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EssaysTable createAlias(String alias) {
    return $EssaysTable(_db, alias);
  }
}

class Template extends DataClass implements Insertable<Template> {
  final int id;
  final int icon;
  final int color;
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final int category;
  final String remark;
  Template(
      {@required this.id,
      @required this.icon,
      @required this.color,
      @required this.name,
      @required this.startTime,
      @required this.endTime,
      @required this.category,
      @required this.remark});
  factory Template.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Template(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      icon: intType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      startTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_time']),
      endTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_time']),
      category:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}category']),
      remark:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}remark']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<int>(icon);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    return map;
  }

  TemplatesCompanion toCompanion(bool nullToAbsent) {
    return TemplatesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      remark:
          remark == null && nullToAbsent ? const Value.absent() : Value(remark),
    );
  }

  factory Template.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Template(
      id: serializer.fromJson<int>(json['id']),
      icon: serializer.fromJson<int>(json['icon']),
      color: serializer.fromJson<int>(json['color']),
      name: serializer.fromJson<String>(json['name']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      category: serializer.fromJson<int>(json['category']),
      remark: serializer.fromJson<String>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'icon': serializer.toJson<int>(icon),
      'color': serializer.toJson<int>(color),
      'name': serializer.toJson<String>(name),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'category': serializer.toJson<int>(category),
      'remark': serializer.toJson<String>(remark),
    };
  }

  Template copyWith(
          {int id,
          int icon,
          int color,
          String name,
          DateTime startTime,
          DateTime endTime,
          int category,
          String remark}) =>
      Template(
        id: id ?? this.id,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        name: name ?? this.name,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        category: category ?? this.category,
        remark: remark ?? this.remark,
      );
  @override
  String toString() {
    return (StringBuffer('Template(')
          ..write('id: $id, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('category: $category, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          icon.hashCode,
          $mrjc(
              color.hashCode,
              $mrjc(
                  name.hashCode,
                  $mrjc(
                      startTime.hashCode,
                      $mrjc(endTime.hashCode,
                          $mrjc(category.hashCode, remark.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Template &&
          other.id == this.id &&
          other.icon == this.icon &&
          other.color == this.color &&
          other.name == this.name &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.category == this.category &&
          other.remark == this.remark);
}

class TemplatesCompanion extends UpdateCompanion<Template> {
  final Value<int> id;
  final Value<int> icon;
  final Value<int> color;
  final Value<String> name;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<int> category;
  final Value<String> remark;
  const TemplatesCompanion({
    this.id = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.name = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.category = const Value.absent(),
    this.remark = const Value.absent(),
  });
  TemplatesCompanion.insert({
    this.id = const Value.absent(),
    @required int icon,
    @required int color,
    @required String name,
    @required DateTime startTime,
    @required DateTime endTime,
    @required int category,
    @required String remark,
  })  : icon = Value(icon),
        color = Value(color),
        name = Value(name),
        startTime = Value(startTime),
        endTime = Value(endTime),
        category = Value(category),
        remark = Value(remark);
  static Insertable<Template> custom({
    Expression<int> id,
    Expression<int> icon,
    Expression<int> color,
    Expression<String> name,
    Expression<DateTime> startTime,
    Expression<DateTime> endTime,
    Expression<int> category,
    Expression<String> remark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
      if (name != null) 'name': name,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (category != null) 'category': category,
      if (remark != null) 'remark': remark,
    });
  }

  TemplatesCompanion copyWith(
      {Value<int> id,
      Value<int> icon,
      Value<int> color,
      Value<String> name,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<int> category,
      Value<String> remark}) {
    return TemplatesCompanion(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      category: category ?? this.category,
      remark: remark ?? this.remark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplatesCompanion(')
          ..write('id: $id, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('category: $category, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $TemplatesTable extends Templates
    with TableInfo<$TemplatesTable, Template> {
  final GeneratedDatabase _db;
  final String _alias;
  $TemplatesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  GeneratedIntColumn _icon;
  @override
  GeneratedIntColumn get icon => _icon ??= _constructIcon();
  GeneratedIntColumn _constructIcon() {
    return GeneratedIntColumn(
      'icon',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _startTimeMeta = const VerificationMeta('startTime');
  GeneratedDateTimeColumn _startTime;
  @override
  GeneratedDateTimeColumn get startTime => _startTime ??= _constructStartTime();
  GeneratedDateTimeColumn _constructStartTime() {
    return GeneratedDateTimeColumn(
      'start_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _endTimeMeta = const VerificationMeta('endTime');
  GeneratedDateTimeColumn _endTime;
  @override
  GeneratedDateTimeColumn get endTime => _endTime ??= _constructEndTime();
  GeneratedDateTimeColumn _constructEndTime() {
    return GeneratedDateTimeColumn(
      'end_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedIntColumn _category;
  @override
  GeneratedIntColumn get category => _category ??= _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  GeneratedTextColumn _remark;
  @override
  GeneratedTextColumn get remark => _remark ??= _constructRemark();
  GeneratedTextColumn _constructRemark() {
    return GeneratedTextColumn(
      'remark',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, icon, color, name, startTime, endTime, category, remark];
  @override
  $TemplatesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'templates';
  @override
  final String actualTableName = 'templates';
  @override
  VerificationContext validateIntegrity(Insertable<Template> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time'], _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time'], _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark'], _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Template map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Template.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TemplatesTable createAlias(String alias) {
    return $TemplatesTable(_db, alias);
  }
}

abstract class _$TablesDao extends GeneratedDatabase {
  _$TablesDao(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $AffairsTable _affairs;
  $AffairsTable get affairs => _affairs ??= $AffairsTable(this);
  $CommonAffairsTable _commonAffairs;
  $CommonAffairsTable get commonAffairs =>
      _commonAffairs ??= $CommonAffairsTable(this);
  $GoalsTable _goals;
  $GoalsTable get goals => _goals ??= $GoalsTable(this);
  $EssaysTable _essays;
  $EssaysTable get essays => _essays ??= $EssaysTable(this);
  $TemplatesTable _templates;
  $TemplatesTable get templates => _templates ??= $TemplatesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [affairs, commonAffairs, goals, essays, templates];
}
