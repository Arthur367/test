// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserDataClass extends DataClass implements Insertable<UserDataClass> {
  final int id;
  final String name;
  final String userCode;
  final String username;
  final String password;
  final DateTime localCreatedAt;
  final DateTime localUpdatedAt;
  UserDataClass(
      {required this.id,
      required this.name,
      required this.userCode,
      required this.username,
      required this.password,
      required this.localCreatedAt,
      required this.localUpdatedAt});
  factory UserDataClass.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      userCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_code'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      localCreatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_created_at'])!,
      localUpdatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['user_code'] = Variable<String>(userCode);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['local_created_at'] = Variable<DateTime>(localCreatedAt);
    map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      name: Value(name),
      userCode: Value(userCode),
      username: Value(username),
      password: Value(password),
      localCreatedAt: Value(localCreatedAt),
      localUpdatedAt: Value(localUpdatedAt),
    );
  }

  factory UserDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDataClass(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userCode: serializer.fromJson<String>(json['userCode']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      localCreatedAt: serializer.fromJson<DateTime>(json['localCreatedAt']),
      localUpdatedAt: serializer.fromJson<DateTime>(json['localUpdatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'userCode': serializer.toJson<String>(userCode),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'localCreatedAt': serializer.toJson<DateTime>(localCreatedAt),
      'localUpdatedAt': serializer.toJson<DateTime>(localUpdatedAt),
    };
  }

  UserDataClass copyWith(
          {int? id,
          String? name,
          String? userCode,
          String? username,
          String? password,
          DateTime? localCreatedAt,
          DateTime? localUpdatedAt}) =>
      UserDataClass(
        id: id ?? this.id,
        name: name ?? this.name,
        userCode: userCode ?? this.userCode,
        username: username ?? this.username,
        password: password ?? this.password,
        localCreatedAt: localCreatedAt ?? this.localCreatedAt,
        localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('UserDataClass(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userCode: $userCode, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, userCode, username, password, localCreatedAt, localUpdatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataClass &&
          other.id == this.id &&
          other.name == this.name &&
          other.userCode == this.userCode &&
          other.username == this.username &&
          other.password == this.password &&
          other.localCreatedAt == this.localCreatedAt &&
          other.localUpdatedAt == this.localUpdatedAt);
}

class UserTableCompanion extends UpdateCompanion<UserDataClass> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> userCode;
  final Value<String> username;
  final Value<String> password;
  final Value<DateTime> localCreatedAt;
  final Value<DateTime> localUpdatedAt;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userCode = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String userCode,
    required String username,
    required String password,
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  })  : name = Value(name),
        userCode = Value(userCode),
        username = Value(username),
        password = Value(password);
  static Insertable<UserDataClass> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? userCode,
    Expression<String>? username,
    Expression<String>? password,
    Expression<DateTime>? localCreatedAt,
    Expression<DateTime>? localUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userCode != null) 'user_code': userCode,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (localCreatedAt != null) 'local_created_at': localCreatedAt,
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? userCode,
      Value<String>? username,
      Value<String>? password,
      Value<DateTime>? localCreatedAt,
      Value<DateTime>? localUpdatedAt}) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userCode: userCode ?? this.userCode,
      username: username ?? this.username,
      password: password ?? this.password,
      localCreatedAt: localCreatedAt ?? this.localCreatedAt,
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
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
    if (userCode.present) {
      map['user_code'] = Variable<String>(userCode.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (localCreatedAt.present) {
      map['local_created_at'] = Variable<DateTime>(localCreatedAt.value);
    }
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userCode: $userCode, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UserTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userCodeMeta = const VerificationMeta('userCode');
  @override
  late final GeneratedColumn<String?> userCode = GeneratedColumn<String?>(
      'user_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _localCreatedAtMeta =
      const VerificationMeta('localCreatedAt');
  @override
  late final GeneratedColumn<DateTime?> localCreatedAt =
      GeneratedColumn<DateTime?>('local_created_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  final VerificationMeta _localUpdatedAtMeta =
      const VerificationMeta('localUpdatedAt');
  @override
  late final GeneratedColumn<DateTime?> localUpdatedAt =
      GeneratedColumn<DateTime?>('local_updated_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, userCode, username, password, localCreatedAt, localUpdatedAt];
  @override
  String get aliasedName => _alias ?? 'user_table';
  @override
  String get actualTableName => 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_code')) {
      context.handle(_userCodeMeta,
          userCode.isAcceptableOrUnknown(data['user_code']!, _userCodeMeta));
    } else if (isInserting) {
      context.missing(_userCodeMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('local_created_at')) {
      context.handle(
          _localCreatedAtMeta,
          localCreatedAt.isAcceptableOrUnknown(
              data['local_created_at']!, _localCreatedAtMeta));
    }
    if (data.containsKey('local_updated_at')) {
      context.handle(
          _localUpdatedAtMeta,
          localUpdatedAt.isAcceptableOrUnknown(
              data['local_updated_at']!, _localUpdatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserDataClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(_db, alias);
  }
}

class StoreDataClass extends DataClass implements Insertable<StoreDataClass> {
  final int id;
  final String storeCode;
  final String storeName;
  final DateTime localCreatedAt;
  final DateTime localUpdatedAt;
  StoreDataClass(
      {required this.id,
      required this.storeCode,
      required this.storeName,
      required this.localCreatedAt,
      required this.localUpdatedAt});
  factory StoreDataClass.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return StoreDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      storeCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}store_code'])!,
      storeName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}store_name'])!,
      localCreatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_created_at'])!,
      localUpdatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['store_code'] = Variable<String>(storeCode);
    map['store_name'] = Variable<String>(storeName);
    map['local_created_at'] = Variable<DateTime>(localCreatedAt);
    map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    return map;
  }

  StoreTableCompanion toCompanion(bool nullToAbsent) {
    return StoreTableCompanion(
      id: Value(id),
      storeCode: Value(storeCode),
      storeName: Value(storeName),
      localCreatedAt: Value(localCreatedAt),
      localUpdatedAt: Value(localUpdatedAt),
    );
  }

  factory StoreDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoreDataClass(
      id: serializer.fromJson<int>(json['id']),
      storeCode: serializer.fromJson<String>(json['storeCode']),
      storeName: serializer.fromJson<String>(json['storeName']),
      localCreatedAt: serializer.fromJson<DateTime>(json['localCreatedAt']),
      localUpdatedAt: serializer.fromJson<DateTime>(json['localUpdatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'storeCode': serializer.toJson<String>(storeCode),
      'storeName': serializer.toJson<String>(storeName),
      'localCreatedAt': serializer.toJson<DateTime>(localCreatedAt),
      'localUpdatedAt': serializer.toJson<DateTime>(localUpdatedAt),
    };
  }

  StoreDataClass copyWith(
          {int? id,
          String? storeCode,
          String? storeName,
          DateTime? localCreatedAt,
          DateTime? localUpdatedAt}) =>
      StoreDataClass(
        id: id ?? this.id,
        storeCode: storeCode ?? this.storeCode,
        storeName: storeName ?? this.storeName,
        localCreatedAt: localCreatedAt ?? this.localCreatedAt,
        localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('StoreDataClass(')
          ..write('id: $id, ')
          ..write('storeCode: $storeCode, ')
          ..write('storeName: $storeName, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, storeCode, storeName, localCreatedAt, localUpdatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoreDataClass &&
          other.id == this.id &&
          other.storeCode == this.storeCode &&
          other.storeName == this.storeName &&
          other.localCreatedAt == this.localCreatedAt &&
          other.localUpdatedAt == this.localUpdatedAt);
}

class StoreTableCompanion extends UpdateCompanion<StoreDataClass> {
  final Value<int> id;
  final Value<String> storeCode;
  final Value<String> storeName;
  final Value<DateTime> localCreatedAt;
  final Value<DateTime> localUpdatedAt;
  const StoreTableCompanion({
    this.id = const Value.absent(),
    this.storeCode = const Value.absent(),
    this.storeName = const Value.absent(),
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  });
  StoreTableCompanion.insert({
    this.id = const Value.absent(),
    required String storeCode,
    required String storeName,
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  })  : storeCode = Value(storeCode),
        storeName = Value(storeName);
  static Insertable<StoreDataClass> custom({
    Expression<int>? id,
    Expression<String>? storeCode,
    Expression<String>? storeName,
    Expression<DateTime>? localCreatedAt,
    Expression<DateTime>? localUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (storeCode != null) 'store_code': storeCode,
      if (storeName != null) 'store_name': storeName,
      if (localCreatedAt != null) 'local_created_at': localCreatedAt,
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
    });
  }

  StoreTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? storeCode,
      Value<String>? storeName,
      Value<DateTime>? localCreatedAt,
      Value<DateTime>? localUpdatedAt}) {
    return StoreTableCompanion(
      id: id ?? this.id,
      storeCode: storeCode ?? this.storeCode,
      storeName: storeName ?? this.storeName,
      localCreatedAt: localCreatedAt ?? this.localCreatedAt,
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (storeCode.present) {
      map['store_code'] = Variable<String>(storeCode.value);
    }
    if (storeName.present) {
      map['store_name'] = Variable<String>(storeName.value);
    }
    if (localCreatedAt.present) {
      map['local_created_at'] = Variable<DateTime>(localCreatedAt.value);
    }
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoreTableCompanion(')
          ..write('id: $id, ')
          ..write('storeCode: $storeCode, ')
          ..write('storeName: $storeName, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }
}

class $StoreTableTable extends StoreTable
    with TableInfo<$StoreTableTable, StoreDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $StoreTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _storeCodeMeta = const VerificationMeta('storeCode');
  @override
  late final GeneratedColumn<String?> storeCode = GeneratedColumn<String?>(
      'store_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _storeNameMeta = const VerificationMeta('storeName');
  @override
  late final GeneratedColumn<String?> storeName = GeneratedColumn<String?>(
      'store_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _localCreatedAtMeta =
      const VerificationMeta('localCreatedAt');
  @override
  late final GeneratedColumn<DateTime?> localCreatedAt =
      GeneratedColumn<DateTime?>('local_created_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  final VerificationMeta _localUpdatedAtMeta =
      const VerificationMeta('localUpdatedAt');
  @override
  late final GeneratedColumn<DateTime?> localUpdatedAt =
      GeneratedColumn<DateTime?>('local_updated_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, storeCode, storeName, localCreatedAt, localUpdatedAt];
  @override
  String get aliasedName => _alias ?? 'store_table';
  @override
  String get actualTableName => 'store_table';
  @override
  VerificationContext validateIntegrity(Insertable<StoreDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('store_code')) {
      context.handle(_storeCodeMeta,
          storeCode.isAcceptableOrUnknown(data['store_code']!, _storeCodeMeta));
    } else if (isInserting) {
      context.missing(_storeCodeMeta);
    }
    if (data.containsKey('store_name')) {
      context.handle(_storeNameMeta,
          storeName.isAcceptableOrUnknown(data['store_name']!, _storeNameMeta));
    } else if (isInserting) {
      context.missing(_storeNameMeta);
    }
    if (data.containsKey('local_created_at')) {
      context.handle(
          _localCreatedAtMeta,
          localCreatedAt.isAcceptableOrUnknown(
              data['local_created_at']!, _localCreatedAtMeta));
    }
    if (data.containsKey('local_updated_at')) {
      context.handle(
          _localUpdatedAtMeta,
          localUpdatedAt.isAcceptableOrUnknown(
              data['local_updated_at']!, _localUpdatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoreDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return StoreDataClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $StoreTableTable createAlias(String alias) {
    return $StoreTableTable(_db, alias);
  }
}

class LocationDataClass extends DataClass
    implements Insertable<LocationDataClass> {
  final int id;
  final String locationCode;
  final String locationName;
  final DateTime localCreatedAt;
  final DateTime localUpdatedAt;
  LocationDataClass(
      {required this.id,
      required this.locationCode,
      required this.locationName,
      required this.localCreatedAt,
      required this.localUpdatedAt});
  factory LocationDataClass.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LocationDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      locationCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location_code'])!,
      locationName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location_name'])!,
      localCreatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_created_at'])!,
      localUpdatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location_code'] = Variable<String>(locationCode);
    map['location_name'] = Variable<String>(locationName);
    map['local_created_at'] = Variable<DateTime>(localCreatedAt);
    map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    return map;
  }

  LocationTableCompanion toCompanion(bool nullToAbsent) {
    return LocationTableCompanion(
      id: Value(id),
      locationCode: Value(locationCode),
      locationName: Value(locationName),
      localCreatedAt: Value(localCreatedAt),
      localUpdatedAt: Value(localUpdatedAt),
    );
  }

  factory LocationDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationDataClass(
      id: serializer.fromJson<int>(json['id']),
      locationCode: serializer.fromJson<String>(json['locationCode']),
      locationName: serializer.fromJson<String>(json['locationName']),
      localCreatedAt: serializer.fromJson<DateTime>(json['localCreatedAt']),
      localUpdatedAt: serializer.fromJson<DateTime>(json['localUpdatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'locationCode': serializer.toJson<String>(locationCode),
      'locationName': serializer.toJson<String>(locationName),
      'localCreatedAt': serializer.toJson<DateTime>(localCreatedAt),
      'localUpdatedAt': serializer.toJson<DateTime>(localUpdatedAt),
    };
  }

  LocationDataClass copyWith(
          {int? id,
          String? locationCode,
          String? locationName,
          DateTime? localCreatedAt,
          DateTime? localUpdatedAt}) =>
      LocationDataClass(
        id: id ?? this.id,
        locationCode: locationCode ?? this.locationCode,
        locationName: locationName ?? this.locationName,
        localCreatedAt: localCreatedAt ?? this.localCreatedAt,
        localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('LocationDataClass(')
          ..write('id: $id, ')
          ..write('locationCode: $locationCode, ')
          ..write('locationName: $locationName, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, locationCode, locationName, localCreatedAt, localUpdatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationDataClass &&
          other.id == this.id &&
          other.locationCode == this.locationCode &&
          other.locationName == this.locationName &&
          other.localCreatedAt == this.localCreatedAt &&
          other.localUpdatedAt == this.localUpdatedAt);
}

class LocationTableCompanion extends UpdateCompanion<LocationDataClass> {
  final Value<int> id;
  final Value<String> locationCode;
  final Value<String> locationName;
  final Value<DateTime> localCreatedAt;
  final Value<DateTime> localUpdatedAt;
  const LocationTableCompanion({
    this.id = const Value.absent(),
    this.locationCode = const Value.absent(),
    this.locationName = const Value.absent(),
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  });
  LocationTableCompanion.insert({
    this.id = const Value.absent(),
    required String locationCode,
    required String locationName,
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  })  : locationCode = Value(locationCode),
        locationName = Value(locationName);
  static Insertable<LocationDataClass> custom({
    Expression<int>? id,
    Expression<String>? locationCode,
    Expression<String>? locationName,
    Expression<DateTime>? localCreatedAt,
    Expression<DateTime>? localUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locationCode != null) 'location_code': locationCode,
      if (locationName != null) 'location_name': locationName,
      if (localCreatedAt != null) 'local_created_at': localCreatedAt,
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
    });
  }

  LocationTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? locationCode,
      Value<String>? locationName,
      Value<DateTime>? localCreatedAt,
      Value<DateTime>? localUpdatedAt}) {
    return LocationTableCompanion(
      id: id ?? this.id,
      locationCode: locationCode ?? this.locationCode,
      locationName: locationName ?? this.locationName,
      localCreatedAt: localCreatedAt ?? this.localCreatedAt,
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (locationCode.present) {
      map['location_code'] = Variable<String>(locationCode.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (localCreatedAt.present) {
      map['local_created_at'] = Variable<DateTime>(localCreatedAt.value);
    }
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationTableCompanion(')
          ..write('id: $id, ')
          ..write('locationCode: $locationCode, ')
          ..write('locationName: $locationName, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }
}

class $LocationTableTable extends LocationTable
    with TableInfo<$LocationTableTable, LocationDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LocationTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _locationCodeMeta =
      const VerificationMeta('locationCode');
  @override
  late final GeneratedColumn<String?> locationCode = GeneratedColumn<String?>(
      'location_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  @override
  late final GeneratedColumn<String?> locationName = GeneratedColumn<String?>(
      'location_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _localCreatedAtMeta =
      const VerificationMeta('localCreatedAt');
  @override
  late final GeneratedColumn<DateTime?> localCreatedAt =
      GeneratedColumn<DateTime?>('local_created_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  final VerificationMeta _localUpdatedAtMeta =
      const VerificationMeta('localUpdatedAt');
  @override
  late final GeneratedColumn<DateTime?> localUpdatedAt =
      GeneratedColumn<DateTime?>('local_updated_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, locationCode, locationName, localCreatedAt, localUpdatedAt];
  @override
  String get aliasedName => _alias ?? 'location_table';
  @override
  String get actualTableName => 'location_table';
  @override
  VerificationContext validateIntegrity(Insertable<LocationDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location_code')) {
      context.handle(
          _locationCodeMeta,
          locationCode.isAcceptableOrUnknown(
              data['location_code']!, _locationCodeMeta));
    } else if (isInserting) {
      context.missing(_locationCodeMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    } else if (isInserting) {
      context.missing(_locationNameMeta);
    }
    if (data.containsKey('local_created_at')) {
      context.handle(
          _localCreatedAtMeta,
          localCreatedAt.isAcceptableOrUnknown(
              data['local_created_at']!, _localCreatedAtMeta));
    }
    if (data.containsKey('local_updated_at')) {
      context.handle(
          _localUpdatedAtMeta,
          localUpdatedAt.isAcceptableOrUnknown(
              data['local_updated_at']!, _localUpdatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return LocationDataClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocationTableTable createAlias(String alias) {
    return $LocationTableTable(_db, alias);
  }
}

class ProductDataClass extends DataClass
    implements Insertable<ProductDataClass> {
  final int id;
  final int autoNumber;
  final String productCode;
  final String productShortCode;
  final String productName;
  final double costPrice;
  final double salesPrice;
  final double tax;
  final double minStock;
  final double maxStock;
  final String vatType;
  final bool inclusiveTax;
  final bool isInclusive;
  final bool isBatch;
  final bool isExpDate;
  final bool isLot;
  final String barCode;
  final bool costVariance;
  final String taxTemplateId;
  final DateTime localCreatedAt;
  final DateTime localUpdatedAt;
  ProductDataClass(
      {required this.id,
      required this.autoNumber,
      required this.productCode,
      required this.productShortCode,
      required this.productName,
      required this.costPrice,
      required this.salesPrice,
      required this.tax,
      required this.minStock,
      required this.maxStock,
      required this.vatType,
      required this.inclusiveTax,
      required this.isInclusive,
      required this.isBatch,
      required this.isExpDate,
      required this.isLot,
      required this.barCode,
      required this.costVariance,
      required this.taxTemplateId,
      required this.localCreatedAt,
      required this.localUpdatedAt});
  factory ProductDataClass.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      autoNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}auto_number'])!,
      productCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_code'])!,
      productShortCode: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}product_short_code'])!,
      productName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name'])!,
      costPrice: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cost_price'])!,
      salesPrice: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sales_price'])!,
      tax: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tax'])!,
      minStock: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}min_stock'])!,
      maxStock: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}max_stock'])!,
      vatType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vat_type'])!,
      inclusiveTax: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}inclusive_tax'])!,
      isInclusive: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_inclusive'])!,
      isBatch: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_batch'])!,
      isExpDate: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_exp_date'])!,
      isLot: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_lot'])!,
      barCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bar_code'])!,
      costVariance: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cost_variance'])!,
      taxTemplateId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_template_id'])!,
      localCreatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_created_at'])!,
      localUpdatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['auto_number'] = Variable<int>(autoNumber);
    map['product_code'] = Variable<String>(productCode);
    map['product_short_code'] = Variable<String>(productShortCode);
    map['product_name'] = Variable<String>(productName);
    map['cost_price'] = Variable<double>(costPrice);
    map['sales_price'] = Variable<double>(salesPrice);
    map['tax'] = Variable<double>(tax);
    map['min_stock'] = Variable<double>(minStock);
    map['max_stock'] = Variable<double>(maxStock);
    map['vat_type'] = Variable<String>(vatType);
    map['inclusive_tax'] = Variable<bool>(inclusiveTax);
    map['is_inclusive'] = Variable<bool>(isInclusive);
    map['is_batch'] = Variable<bool>(isBatch);
    map['is_exp_date'] = Variable<bool>(isExpDate);
    map['is_lot'] = Variable<bool>(isLot);
    map['bar_code'] = Variable<String>(barCode);
    map['cost_variance'] = Variable<bool>(costVariance);
    map['tax_template_id'] = Variable<String>(taxTemplateId);
    map['local_created_at'] = Variable<DateTime>(localCreatedAt);
    map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    return map;
  }

  ProductTableCompanion toCompanion(bool nullToAbsent) {
    return ProductTableCompanion(
      id: Value(id),
      autoNumber: Value(autoNumber),
      productCode: Value(productCode),
      productShortCode: Value(productShortCode),
      productName: Value(productName),
      costPrice: Value(costPrice),
      salesPrice: Value(salesPrice),
      tax: Value(tax),
      minStock: Value(minStock),
      maxStock: Value(maxStock),
      vatType: Value(vatType),
      inclusiveTax: Value(inclusiveTax),
      isInclusive: Value(isInclusive),
      isBatch: Value(isBatch),
      isExpDate: Value(isExpDate),
      isLot: Value(isLot),
      barCode: Value(barCode),
      costVariance: Value(costVariance),
      taxTemplateId: Value(taxTemplateId),
      localCreatedAt: Value(localCreatedAt),
      localUpdatedAt: Value(localUpdatedAt),
    );
  }

  factory ProductDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductDataClass(
      id: serializer.fromJson<int>(json['id']),
      autoNumber: serializer.fromJson<int>(json['autoNumber']),
      productCode: serializer.fromJson<String>(json['productCode']),
      productShortCode: serializer.fromJson<String>(json['productShortCode']),
      productName: serializer.fromJson<String>(json['productName']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      salesPrice: serializer.fromJson<double>(json['salesPrice']),
      tax: serializer.fromJson<double>(json['tax']),
      minStock: serializer.fromJson<double>(json['minStock']),
      maxStock: serializer.fromJson<double>(json['maxStock']),
      vatType: serializer.fromJson<String>(json['vatType']),
      inclusiveTax: serializer.fromJson<bool>(json['inclusiveTax']),
      isInclusive: serializer.fromJson<bool>(json['isInclusive']),
      isBatch: serializer.fromJson<bool>(json['isBatch']),
      isExpDate: serializer.fromJson<bool>(json['isExpDate']),
      isLot: serializer.fromJson<bool>(json['isLot']),
      barCode: serializer.fromJson<String>(json['barCode']),
      costVariance: serializer.fromJson<bool>(json['costVariance']),
      taxTemplateId: serializer.fromJson<String>(json['taxTemplateId']),
      localCreatedAt: serializer.fromJson<DateTime>(json['localCreatedAt']),
      localUpdatedAt: serializer.fromJson<DateTime>(json['localUpdatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'autoNumber': serializer.toJson<int>(autoNumber),
      'productCode': serializer.toJson<String>(productCode),
      'productShortCode': serializer.toJson<String>(productShortCode),
      'productName': serializer.toJson<String>(productName),
      'costPrice': serializer.toJson<double>(costPrice),
      'salesPrice': serializer.toJson<double>(salesPrice),
      'tax': serializer.toJson<double>(tax),
      'minStock': serializer.toJson<double>(minStock),
      'maxStock': serializer.toJson<double>(maxStock),
      'vatType': serializer.toJson<String>(vatType),
      'inclusiveTax': serializer.toJson<bool>(inclusiveTax),
      'isInclusive': serializer.toJson<bool>(isInclusive),
      'isBatch': serializer.toJson<bool>(isBatch),
      'isExpDate': serializer.toJson<bool>(isExpDate),
      'isLot': serializer.toJson<bool>(isLot),
      'barCode': serializer.toJson<String>(barCode),
      'costVariance': serializer.toJson<bool>(costVariance),
      'taxTemplateId': serializer.toJson<String>(taxTemplateId),
      'localCreatedAt': serializer.toJson<DateTime>(localCreatedAt),
      'localUpdatedAt': serializer.toJson<DateTime>(localUpdatedAt),
    };
  }

  ProductDataClass copyWith(
          {int? id,
          int? autoNumber,
          String? productCode,
          String? productShortCode,
          String? productName,
          double? costPrice,
          double? salesPrice,
          double? tax,
          double? minStock,
          double? maxStock,
          String? vatType,
          bool? inclusiveTax,
          bool? isInclusive,
          bool? isBatch,
          bool? isExpDate,
          bool? isLot,
          String? barCode,
          bool? costVariance,
          String? taxTemplateId,
          DateTime? localCreatedAt,
          DateTime? localUpdatedAt}) =>
      ProductDataClass(
        id: id ?? this.id,
        autoNumber: autoNumber ?? this.autoNumber,
        productCode: productCode ?? this.productCode,
        productShortCode: productShortCode ?? this.productShortCode,
        productName: productName ?? this.productName,
        costPrice: costPrice ?? this.costPrice,
        salesPrice: salesPrice ?? this.salesPrice,
        tax: tax ?? this.tax,
        minStock: minStock ?? this.minStock,
        maxStock: maxStock ?? this.maxStock,
        vatType: vatType ?? this.vatType,
        inclusiveTax: inclusiveTax ?? this.inclusiveTax,
        isInclusive: isInclusive ?? this.isInclusive,
        isBatch: isBatch ?? this.isBatch,
        isExpDate: isExpDate ?? this.isExpDate,
        isLot: isLot ?? this.isLot,
        barCode: barCode ?? this.barCode,
        costVariance: costVariance ?? this.costVariance,
        taxTemplateId: taxTemplateId ?? this.taxTemplateId,
        localCreatedAt: localCreatedAt ?? this.localCreatedAt,
        localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ProductDataClass(')
          ..write('id: $id, ')
          ..write('autoNumber: $autoNumber, ')
          ..write('productCode: $productCode, ')
          ..write('productShortCode: $productShortCode, ')
          ..write('productName: $productName, ')
          ..write('costPrice: $costPrice, ')
          ..write('salesPrice: $salesPrice, ')
          ..write('tax: $tax, ')
          ..write('minStock: $minStock, ')
          ..write('maxStock: $maxStock, ')
          ..write('vatType: $vatType, ')
          ..write('inclusiveTax: $inclusiveTax, ')
          ..write('isInclusive: $isInclusive, ')
          ..write('isBatch: $isBatch, ')
          ..write('isExpDate: $isExpDate, ')
          ..write('isLot: $isLot, ')
          ..write('barCode: $barCode, ')
          ..write('costVariance: $costVariance, ')
          ..write('taxTemplateId: $taxTemplateId, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        autoNumber,
        productCode,
        productShortCode,
        productName,
        costPrice,
        salesPrice,
        tax,
        minStock,
        maxStock,
        vatType,
        inclusiveTax,
        isInclusive,
        isBatch,
        isExpDate,
        isLot,
        barCode,
        costVariance,
        taxTemplateId,
        localCreatedAt,
        localUpdatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductDataClass &&
          other.id == this.id &&
          other.autoNumber == this.autoNumber &&
          other.productCode == this.productCode &&
          other.productShortCode == this.productShortCode &&
          other.productName == this.productName &&
          other.costPrice == this.costPrice &&
          other.salesPrice == this.salesPrice &&
          other.tax == this.tax &&
          other.minStock == this.minStock &&
          other.maxStock == this.maxStock &&
          other.vatType == this.vatType &&
          other.inclusiveTax == this.inclusiveTax &&
          other.isInclusive == this.isInclusive &&
          other.isBatch == this.isBatch &&
          other.isExpDate == this.isExpDate &&
          other.isLot == this.isLot &&
          other.barCode == this.barCode &&
          other.costVariance == this.costVariance &&
          other.taxTemplateId == this.taxTemplateId &&
          other.localCreatedAt == this.localCreatedAt &&
          other.localUpdatedAt == this.localUpdatedAt);
}

class ProductTableCompanion extends UpdateCompanion<ProductDataClass> {
  final Value<int> id;
  final Value<int> autoNumber;
  final Value<String> productCode;
  final Value<String> productShortCode;
  final Value<String> productName;
  final Value<double> costPrice;
  final Value<double> salesPrice;
  final Value<double> tax;
  final Value<double> minStock;
  final Value<double> maxStock;
  final Value<String> vatType;
  final Value<bool> inclusiveTax;
  final Value<bool> isInclusive;
  final Value<bool> isBatch;
  final Value<bool> isExpDate;
  final Value<bool> isLot;
  final Value<String> barCode;
  final Value<bool> costVariance;
  final Value<String> taxTemplateId;
  final Value<DateTime> localCreatedAt;
  final Value<DateTime> localUpdatedAt;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.autoNumber = const Value.absent(),
    this.productCode = const Value.absent(),
    this.productShortCode = const Value.absent(),
    this.productName = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.salesPrice = const Value.absent(),
    this.tax = const Value.absent(),
    this.minStock = const Value.absent(),
    this.maxStock = const Value.absent(),
    this.vatType = const Value.absent(),
    this.inclusiveTax = const Value.absent(),
    this.isInclusive = const Value.absent(),
    this.isBatch = const Value.absent(),
    this.isExpDate = const Value.absent(),
    this.isLot = const Value.absent(),
    this.barCode = const Value.absent(),
    this.costVariance = const Value.absent(),
    this.taxTemplateId = const Value.absent(),
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required int autoNumber,
    required String productCode,
    required String productShortCode,
    required String productName,
    required double costPrice,
    required double salesPrice,
    required double tax,
    required double minStock,
    required double maxStock,
    required String vatType,
    required bool inclusiveTax,
    required bool isInclusive,
    required bool isBatch,
    required bool isExpDate,
    required bool isLot,
    required String barCode,
    required bool costVariance,
    required String taxTemplateId,
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  })  : autoNumber = Value(autoNumber),
        productCode = Value(productCode),
        productShortCode = Value(productShortCode),
        productName = Value(productName),
        costPrice = Value(costPrice),
        salesPrice = Value(salesPrice),
        tax = Value(tax),
        minStock = Value(minStock),
        maxStock = Value(maxStock),
        vatType = Value(vatType),
        inclusiveTax = Value(inclusiveTax),
        isInclusive = Value(isInclusive),
        isBatch = Value(isBatch),
        isExpDate = Value(isExpDate),
        isLot = Value(isLot),
        barCode = Value(barCode),
        costVariance = Value(costVariance),
        taxTemplateId = Value(taxTemplateId);
  static Insertable<ProductDataClass> custom({
    Expression<int>? id,
    Expression<int>? autoNumber,
    Expression<String>? productCode,
    Expression<String>? productShortCode,
    Expression<String>? productName,
    Expression<double>? costPrice,
    Expression<double>? salesPrice,
    Expression<double>? tax,
    Expression<double>? minStock,
    Expression<double>? maxStock,
    Expression<String>? vatType,
    Expression<bool>? inclusiveTax,
    Expression<bool>? isInclusive,
    Expression<bool>? isBatch,
    Expression<bool>? isExpDate,
    Expression<bool>? isLot,
    Expression<String>? barCode,
    Expression<bool>? costVariance,
    Expression<String>? taxTemplateId,
    Expression<DateTime>? localCreatedAt,
    Expression<DateTime>? localUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (autoNumber != null) 'auto_number': autoNumber,
      if (productCode != null) 'product_code': productCode,
      if (productShortCode != null) 'product_short_code': productShortCode,
      if (productName != null) 'product_name': productName,
      if (costPrice != null) 'cost_price': costPrice,
      if (salesPrice != null) 'sales_price': salesPrice,
      if (tax != null) 'tax': tax,
      if (minStock != null) 'min_stock': minStock,
      if (maxStock != null) 'max_stock': maxStock,
      if (vatType != null) 'vat_type': vatType,
      if (inclusiveTax != null) 'inclusive_tax': inclusiveTax,
      if (isInclusive != null) 'is_inclusive': isInclusive,
      if (isBatch != null) 'is_batch': isBatch,
      if (isExpDate != null) 'is_exp_date': isExpDate,
      if (isLot != null) 'is_lot': isLot,
      if (barCode != null) 'bar_code': barCode,
      if (costVariance != null) 'cost_variance': costVariance,
      if (taxTemplateId != null) 'tax_template_id': taxTemplateId,
      if (localCreatedAt != null) 'local_created_at': localCreatedAt,
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
    });
  }

  ProductTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? autoNumber,
      Value<String>? productCode,
      Value<String>? productShortCode,
      Value<String>? productName,
      Value<double>? costPrice,
      Value<double>? salesPrice,
      Value<double>? tax,
      Value<double>? minStock,
      Value<double>? maxStock,
      Value<String>? vatType,
      Value<bool>? inclusiveTax,
      Value<bool>? isInclusive,
      Value<bool>? isBatch,
      Value<bool>? isExpDate,
      Value<bool>? isLot,
      Value<String>? barCode,
      Value<bool>? costVariance,
      Value<String>? taxTemplateId,
      Value<DateTime>? localCreatedAt,
      Value<DateTime>? localUpdatedAt}) {
    return ProductTableCompanion(
      id: id ?? this.id,
      autoNumber: autoNumber ?? this.autoNumber,
      productCode: productCode ?? this.productCode,
      productShortCode: productShortCode ?? this.productShortCode,
      productName: productName ?? this.productName,
      costPrice: costPrice ?? this.costPrice,
      salesPrice: salesPrice ?? this.salesPrice,
      tax: tax ?? this.tax,
      minStock: minStock ?? this.minStock,
      maxStock: maxStock ?? this.maxStock,
      vatType: vatType ?? this.vatType,
      inclusiveTax: inclusiveTax ?? this.inclusiveTax,
      isInclusive: isInclusive ?? this.isInclusive,
      isBatch: isBatch ?? this.isBatch,
      isExpDate: isExpDate ?? this.isExpDate,
      isLot: isLot ?? this.isLot,
      barCode: barCode ?? this.barCode,
      costVariance: costVariance ?? this.costVariance,
      taxTemplateId: taxTemplateId ?? this.taxTemplateId,
      localCreatedAt: localCreatedAt ?? this.localCreatedAt,
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (autoNumber.present) {
      map['auto_number'] = Variable<int>(autoNumber.value);
    }
    if (productCode.present) {
      map['product_code'] = Variable<String>(productCode.value);
    }
    if (productShortCode.present) {
      map['product_short_code'] = Variable<String>(productShortCode.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (salesPrice.present) {
      map['sales_price'] = Variable<double>(salesPrice.value);
    }
    if (tax.present) {
      map['tax'] = Variable<double>(tax.value);
    }
    if (minStock.present) {
      map['min_stock'] = Variable<double>(minStock.value);
    }
    if (maxStock.present) {
      map['max_stock'] = Variable<double>(maxStock.value);
    }
    if (vatType.present) {
      map['vat_type'] = Variable<String>(vatType.value);
    }
    if (inclusiveTax.present) {
      map['inclusive_tax'] = Variable<bool>(inclusiveTax.value);
    }
    if (isInclusive.present) {
      map['is_inclusive'] = Variable<bool>(isInclusive.value);
    }
    if (isBatch.present) {
      map['is_batch'] = Variable<bool>(isBatch.value);
    }
    if (isExpDate.present) {
      map['is_exp_date'] = Variable<bool>(isExpDate.value);
    }
    if (isLot.present) {
      map['is_lot'] = Variable<bool>(isLot.value);
    }
    if (barCode.present) {
      map['bar_code'] = Variable<String>(barCode.value);
    }
    if (costVariance.present) {
      map['cost_variance'] = Variable<bool>(costVariance.value);
    }
    if (taxTemplateId.present) {
      map['tax_template_id'] = Variable<String>(taxTemplateId.value);
    }
    if (localCreatedAt.present) {
      map['local_created_at'] = Variable<DateTime>(localCreatedAt.value);
    }
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('id: $id, ')
          ..write('autoNumber: $autoNumber, ')
          ..write('productCode: $productCode, ')
          ..write('productShortCode: $productShortCode, ')
          ..write('productName: $productName, ')
          ..write('costPrice: $costPrice, ')
          ..write('salesPrice: $salesPrice, ')
          ..write('tax: $tax, ')
          ..write('minStock: $minStock, ')
          ..write('maxStock: $maxStock, ')
          ..write('vatType: $vatType, ')
          ..write('inclusiveTax: $inclusiveTax, ')
          ..write('isInclusive: $isInclusive, ')
          ..write('isBatch: $isBatch, ')
          ..write('isExpDate: $isExpDate, ')
          ..write('isLot: $isLot, ')
          ..write('barCode: $barCode, ')
          ..write('costVariance: $costVariance, ')
          ..write('taxTemplateId: $taxTemplateId, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, ProductDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ProductTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _autoNumberMeta = const VerificationMeta('autoNumber');
  @override
  late final GeneratedColumn<int?> autoNumber = GeneratedColumn<int?>(
      'auto_number', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _productCodeMeta =
      const VerificationMeta('productCode');
  @override
  late final GeneratedColumn<String?> productCode = GeneratedColumn<String?>(
      'product_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _productShortCodeMeta =
      const VerificationMeta('productShortCode');
  @override
  late final GeneratedColumn<String?> productShortCode =
      GeneratedColumn<String?>('product_short_code', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String?> productName = GeneratedColumn<String?>(
      'product_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _costPriceMeta = const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<double?> costPrice = GeneratedColumn<double?>(
      'cost_price', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _salesPriceMeta = const VerificationMeta('salesPrice');
  @override
  late final GeneratedColumn<double?> salesPrice = GeneratedColumn<double?>(
      'sales_price', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _taxMeta = const VerificationMeta('tax');
  @override
  late final GeneratedColumn<double?> tax = GeneratedColumn<double?>(
      'tax', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _minStockMeta = const VerificationMeta('minStock');
  @override
  late final GeneratedColumn<double?> minStock = GeneratedColumn<double?>(
      'min_stock', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _maxStockMeta = const VerificationMeta('maxStock');
  @override
  late final GeneratedColumn<double?> maxStock = GeneratedColumn<double?>(
      'max_stock', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _vatTypeMeta = const VerificationMeta('vatType');
  @override
  late final GeneratedColumn<String?> vatType = GeneratedColumn<String?>(
      'vat_type', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _inclusiveTaxMeta =
      const VerificationMeta('inclusiveTax');
  @override
  late final GeneratedColumn<bool?> inclusiveTax = GeneratedColumn<bool?>(
      'inclusive_tax', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (inclusive_tax IN (0, 1))');
  final VerificationMeta _isInclusiveMeta =
      const VerificationMeta('isInclusive');
  @override
  late final GeneratedColumn<bool?> isInclusive = GeneratedColumn<bool?>(
      'is_inclusive', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_inclusive IN (0, 1))');
  final VerificationMeta _isBatchMeta = const VerificationMeta('isBatch');
  @override
  late final GeneratedColumn<bool?> isBatch = GeneratedColumn<bool?>(
      'is_batch', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_batch IN (0, 1))');
  final VerificationMeta _isExpDateMeta = const VerificationMeta('isExpDate');
  @override
  late final GeneratedColumn<bool?> isExpDate = GeneratedColumn<bool?>(
      'is_exp_date', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_exp_date IN (0, 1))');
  final VerificationMeta _isLotMeta = const VerificationMeta('isLot');
  @override
  late final GeneratedColumn<bool?> isLot = GeneratedColumn<bool?>(
      'is_lot', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_lot IN (0, 1))');
  final VerificationMeta _barCodeMeta = const VerificationMeta('barCode');
  @override
  late final GeneratedColumn<String?> barCode = GeneratedColumn<String?>(
      'bar_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _costVarianceMeta =
      const VerificationMeta('costVariance');
  @override
  late final GeneratedColumn<bool?> costVariance = GeneratedColumn<bool?>(
      'cost_variance', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (cost_variance IN (0, 1))');
  final VerificationMeta _taxTemplateIdMeta =
      const VerificationMeta('taxTemplateId');
  @override
  late final GeneratedColumn<String?> taxTemplateId = GeneratedColumn<String?>(
      'tax_template_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _localCreatedAtMeta =
      const VerificationMeta('localCreatedAt');
  @override
  late final GeneratedColumn<DateTime?> localCreatedAt =
      GeneratedColumn<DateTime?>('local_created_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  final VerificationMeta _localUpdatedAtMeta =
      const VerificationMeta('localUpdatedAt');
  @override
  late final GeneratedColumn<DateTime?> localUpdatedAt =
      GeneratedColumn<DateTime?>('local_updated_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        autoNumber,
        productCode,
        productShortCode,
        productName,
        costPrice,
        salesPrice,
        tax,
        minStock,
        maxStock,
        vatType,
        inclusiveTax,
        isInclusive,
        isBatch,
        isExpDate,
        isLot,
        barCode,
        costVariance,
        taxTemplateId,
        localCreatedAt,
        localUpdatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'product_table';
  @override
  String get actualTableName => 'product_table';
  @override
  VerificationContext validateIntegrity(Insertable<ProductDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('auto_number')) {
      context.handle(
          _autoNumberMeta,
          autoNumber.isAcceptableOrUnknown(
              data['auto_number']!, _autoNumberMeta));
    } else if (isInserting) {
      context.missing(_autoNumberMeta);
    }
    if (data.containsKey('product_code')) {
      context.handle(
          _productCodeMeta,
          productCode.isAcceptableOrUnknown(
              data['product_code']!, _productCodeMeta));
    } else if (isInserting) {
      context.missing(_productCodeMeta);
    }
    if (data.containsKey('product_short_code')) {
      context.handle(
          _productShortCodeMeta,
          productShortCode.isAcceptableOrUnknown(
              data['product_short_code']!, _productShortCodeMeta));
    } else if (isInserting) {
      context.missing(_productShortCodeMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    } else if (isInserting) {
      context.missing(_costPriceMeta);
    }
    if (data.containsKey('sales_price')) {
      context.handle(
          _salesPriceMeta,
          salesPrice.isAcceptableOrUnknown(
              data['sales_price']!, _salesPriceMeta));
    } else if (isInserting) {
      context.missing(_salesPriceMeta);
    }
    if (data.containsKey('tax')) {
      context.handle(
          _taxMeta, tax.isAcceptableOrUnknown(data['tax']!, _taxMeta));
    } else if (isInserting) {
      context.missing(_taxMeta);
    }
    if (data.containsKey('min_stock')) {
      context.handle(_minStockMeta,
          minStock.isAcceptableOrUnknown(data['min_stock']!, _minStockMeta));
    } else if (isInserting) {
      context.missing(_minStockMeta);
    }
    if (data.containsKey('max_stock')) {
      context.handle(_maxStockMeta,
          maxStock.isAcceptableOrUnknown(data['max_stock']!, _maxStockMeta));
    } else if (isInserting) {
      context.missing(_maxStockMeta);
    }
    if (data.containsKey('vat_type')) {
      context.handle(_vatTypeMeta,
          vatType.isAcceptableOrUnknown(data['vat_type']!, _vatTypeMeta));
    } else if (isInserting) {
      context.missing(_vatTypeMeta);
    }
    if (data.containsKey('inclusive_tax')) {
      context.handle(
          _inclusiveTaxMeta,
          inclusiveTax.isAcceptableOrUnknown(
              data['inclusive_tax']!, _inclusiveTaxMeta));
    } else if (isInserting) {
      context.missing(_inclusiveTaxMeta);
    }
    if (data.containsKey('is_inclusive')) {
      context.handle(
          _isInclusiveMeta,
          isInclusive.isAcceptableOrUnknown(
              data['is_inclusive']!, _isInclusiveMeta));
    } else if (isInserting) {
      context.missing(_isInclusiveMeta);
    }
    if (data.containsKey('is_batch')) {
      context.handle(_isBatchMeta,
          isBatch.isAcceptableOrUnknown(data['is_batch']!, _isBatchMeta));
    } else if (isInserting) {
      context.missing(_isBatchMeta);
    }
    if (data.containsKey('is_exp_date')) {
      context.handle(
          _isExpDateMeta,
          isExpDate.isAcceptableOrUnknown(
              data['is_exp_date']!, _isExpDateMeta));
    } else if (isInserting) {
      context.missing(_isExpDateMeta);
    }
    if (data.containsKey('is_lot')) {
      context.handle(
          _isLotMeta, isLot.isAcceptableOrUnknown(data['is_lot']!, _isLotMeta));
    } else if (isInserting) {
      context.missing(_isLotMeta);
    }
    if (data.containsKey('bar_code')) {
      context.handle(_barCodeMeta,
          barCode.isAcceptableOrUnknown(data['bar_code']!, _barCodeMeta));
    } else if (isInserting) {
      context.missing(_barCodeMeta);
    }
    if (data.containsKey('cost_variance')) {
      context.handle(
          _costVarianceMeta,
          costVariance.isAcceptableOrUnknown(
              data['cost_variance']!, _costVarianceMeta));
    } else if (isInserting) {
      context.missing(_costVarianceMeta);
    }
    if (data.containsKey('tax_template_id')) {
      context.handle(
          _taxTemplateIdMeta,
          taxTemplateId.isAcceptableOrUnknown(
              data['tax_template_id']!, _taxTemplateIdMeta));
    } else if (isInserting) {
      context.missing(_taxTemplateIdMeta);
    }
    if (data.containsKey('local_created_at')) {
      context.handle(
          _localCreatedAtMeta,
          localCreatedAt.isAcceptableOrUnknown(
              data['local_created_at']!, _localCreatedAtMeta));
    }
    if (data.containsKey('local_updated_at')) {
      context.handle(
          _localUpdatedAtMeta,
          localUpdatedAt.isAcceptableOrUnknown(
              data['local_updated_at']!, _localUpdatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProductDataClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(_db, alias);
  }
}

class VatDataClass extends DataClass implements Insertable<VatDataClass> {
  final int id;
  final int autoNumber;
  final String vatId;
  final String vatName;
  final String flag;
  final DateTime localCreatedAt;
  final DateTime localUpdatedAt;
  VatDataClass(
      {required this.id,
      required this.autoNumber,
      required this.vatId,
      required this.vatName,
      required this.flag,
      required this.localCreatedAt,
      required this.localUpdatedAt});
  factory VatDataClass.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return VatDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      autoNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}auto_number'])!,
      vatId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vat_id'])!,
      vatName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vat_name'])!,
      flag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}flag'])!,
      localCreatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_created_at'])!,
      localUpdatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['auto_number'] = Variable<int>(autoNumber);
    map['vat_id'] = Variable<String>(vatId);
    map['vat_name'] = Variable<String>(vatName);
    map['flag'] = Variable<String>(flag);
    map['local_created_at'] = Variable<DateTime>(localCreatedAt);
    map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    return map;
  }

  VatTableCompanion toCompanion(bool nullToAbsent) {
    return VatTableCompanion(
      id: Value(id),
      autoNumber: Value(autoNumber),
      vatId: Value(vatId),
      vatName: Value(vatName),
      flag: Value(flag),
      localCreatedAt: Value(localCreatedAt),
      localUpdatedAt: Value(localUpdatedAt),
    );
  }

  factory VatDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VatDataClass(
      id: serializer.fromJson<int>(json['id']),
      autoNumber: serializer.fromJson<int>(json['autoNumber']),
      vatId: serializer.fromJson<String>(json['vatId']),
      vatName: serializer.fromJson<String>(json['vatName']),
      flag: serializer.fromJson<String>(json['flag']),
      localCreatedAt: serializer.fromJson<DateTime>(json['localCreatedAt']),
      localUpdatedAt: serializer.fromJson<DateTime>(json['localUpdatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'autoNumber': serializer.toJson<int>(autoNumber),
      'vatId': serializer.toJson<String>(vatId),
      'vatName': serializer.toJson<String>(vatName),
      'flag': serializer.toJson<String>(flag),
      'localCreatedAt': serializer.toJson<DateTime>(localCreatedAt),
      'localUpdatedAt': serializer.toJson<DateTime>(localUpdatedAt),
    };
  }

  VatDataClass copyWith(
          {int? id,
          int? autoNumber,
          String? vatId,
          String? vatName,
          String? flag,
          DateTime? localCreatedAt,
          DateTime? localUpdatedAt}) =>
      VatDataClass(
        id: id ?? this.id,
        autoNumber: autoNumber ?? this.autoNumber,
        vatId: vatId ?? this.vatId,
        vatName: vatName ?? this.vatName,
        flag: flag ?? this.flag,
        localCreatedAt: localCreatedAt ?? this.localCreatedAt,
        localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('VatDataClass(')
          ..write('id: $id, ')
          ..write('autoNumber: $autoNumber, ')
          ..write('vatId: $vatId, ')
          ..write('vatName: $vatName, ')
          ..write('flag: $flag, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, autoNumber, vatId, vatName, flag, localCreatedAt, localUpdatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VatDataClass &&
          other.id == this.id &&
          other.autoNumber == this.autoNumber &&
          other.vatId == this.vatId &&
          other.vatName == this.vatName &&
          other.flag == this.flag &&
          other.localCreatedAt == this.localCreatedAt &&
          other.localUpdatedAt == this.localUpdatedAt);
}

class VatTableCompanion extends UpdateCompanion<VatDataClass> {
  final Value<int> id;
  final Value<int> autoNumber;
  final Value<String> vatId;
  final Value<String> vatName;
  final Value<String> flag;
  final Value<DateTime> localCreatedAt;
  final Value<DateTime> localUpdatedAt;
  const VatTableCompanion({
    this.id = const Value.absent(),
    this.autoNumber = const Value.absent(),
    this.vatId = const Value.absent(),
    this.vatName = const Value.absent(),
    this.flag = const Value.absent(),
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  });
  VatTableCompanion.insert({
    this.id = const Value.absent(),
    required int autoNumber,
    required String vatId,
    required String vatName,
    required String flag,
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  })  : autoNumber = Value(autoNumber),
        vatId = Value(vatId),
        vatName = Value(vatName),
        flag = Value(flag);
  static Insertable<VatDataClass> custom({
    Expression<int>? id,
    Expression<int>? autoNumber,
    Expression<String>? vatId,
    Expression<String>? vatName,
    Expression<String>? flag,
    Expression<DateTime>? localCreatedAt,
    Expression<DateTime>? localUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (autoNumber != null) 'auto_number': autoNumber,
      if (vatId != null) 'vat_id': vatId,
      if (vatName != null) 'vat_name': vatName,
      if (flag != null) 'flag': flag,
      if (localCreatedAt != null) 'local_created_at': localCreatedAt,
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
    });
  }

  VatTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? autoNumber,
      Value<String>? vatId,
      Value<String>? vatName,
      Value<String>? flag,
      Value<DateTime>? localCreatedAt,
      Value<DateTime>? localUpdatedAt}) {
    return VatTableCompanion(
      id: id ?? this.id,
      autoNumber: autoNumber ?? this.autoNumber,
      vatId: vatId ?? this.vatId,
      vatName: vatName ?? this.vatName,
      flag: flag ?? this.flag,
      localCreatedAt: localCreatedAt ?? this.localCreatedAt,
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (autoNumber.present) {
      map['auto_number'] = Variable<int>(autoNumber.value);
    }
    if (vatId.present) {
      map['vat_id'] = Variable<String>(vatId.value);
    }
    if (vatName.present) {
      map['vat_name'] = Variable<String>(vatName.value);
    }
    if (flag.present) {
      map['flag'] = Variable<String>(flag.value);
    }
    if (localCreatedAt.present) {
      map['local_created_at'] = Variable<DateTime>(localCreatedAt.value);
    }
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VatTableCompanion(')
          ..write('id: $id, ')
          ..write('autoNumber: $autoNumber, ')
          ..write('vatId: $vatId, ')
          ..write('vatName: $vatName, ')
          ..write('flag: $flag, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }
}

class $VatTableTable extends VatTable
    with TableInfo<$VatTableTable, VatDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $VatTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _autoNumberMeta = const VerificationMeta('autoNumber');
  @override
  late final GeneratedColumn<int?> autoNumber = GeneratedColumn<int?>(
      'auto_number', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _vatIdMeta = const VerificationMeta('vatId');
  @override
  late final GeneratedColumn<String?> vatId = GeneratedColumn<String?>(
      'vat_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _vatNameMeta = const VerificationMeta('vatName');
  @override
  late final GeneratedColumn<String?> vatName = GeneratedColumn<String?>(
      'vat_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _flagMeta = const VerificationMeta('flag');
  @override
  late final GeneratedColumn<String?> flag = GeneratedColumn<String?>(
      'flag', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _localCreatedAtMeta =
      const VerificationMeta('localCreatedAt');
  @override
  late final GeneratedColumn<DateTime?> localCreatedAt =
      GeneratedColumn<DateTime?>('local_created_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  final VerificationMeta _localUpdatedAtMeta =
      const VerificationMeta('localUpdatedAt');
  @override
  late final GeneratedColumn<DateTime?> localUpdatedAt =
      GeneratedColumn<DateTime?>('local_updated_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, autoNumber, vatId, vatName, flag, localCreatedAt, localUpdatedAt];
  @override
  String get aliasedName => _alias ?? 'vat_table';
  @override
  String get actualTableName => 'vat_table';
  @override
  VerificationContext validateIntegrity(Insertable<VatDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('auto_number')) {
      context.handle(
          _autoNumberMeta,
          autoNumber.isAcceptableOrUnknown(
              data['auto_number']!, _autoNumberMeta));
    } else if (isInserting) {
      context.missing(_autoNumberMeta);
    }
    if (data.containsKey('vat_id')) {
      context.handle(
          _vatIdMeta, vatId.isAcceptableOrUnknown(data['vat_id']!, _vatIdMeta));
    } else if (isInserting) {
      context.missing(_vatIdMeta);
    }
    if (data.containsKey('vat_name')) {
      context.handle(_vatNameMeta,
          vatName.isAcceptableOrUnknown(data['vat_name']!, _vatNameMeta));
    } else if (isInserting) {
      context.missing(_vatNameMeta);
    }
    if (data.containsKey('flag')) {
      context.handle(
          _flagMeta, flag.isAcceptableOrUnknown(data['flag']!, _flagMeta));
    } else if (isInserting) {
      context.missing(_flagMeta);
    }
    if (data.containsKey('local_created_at')) {
      context.handle(
          _localCreatedAtMeta,
          localCreatedAt.isAcceptableOrUnknown(
              data['local_created_at']!, _localCreatedAtMeta));
    }
    if (data.containsKey('local_updated_at')) {
      context.handle(
          _localUpdatedAtMeta,
          localUpdatedAt.isAcceptableOrUnknown(
              data['local_updated_at']!, _localUpdatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VatDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return VatDataClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $VatTableTable createAlias(String alias) {
    return $VatTableTable(_db, alias);
  }
}

class TaxDataClass extends DataClass implements Insertable<TaxDataClass> {
  final int id;
  final int autoNumber;
  final String taxId;
  final String taxName;
  final double taxPercent;
  final bool excludeGoods;
  final DateTime localCreatedAt;
  final DateTime localUpdatedAt;
  TaxDataClass(
      {required this.id,
      required this.autoNumber,
      required this.taxId,
      required this.taxName,
      required this.taxPercent,
      required this.excludeGoods,
      required this.localCreatedAt,
      required this.localUpdatedAt});
  factory TaxDataClass.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TaxDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      autoNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}auto_number'])!,
      taxId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_id'])!,
      taxName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_name'])!,
      taxPercent: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_percent'])!,
      excludeGoods: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exclude_goods'])!,
      localCreatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_created_at'])!,
      localUpdatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['auto_number'] = Variable<int>(autoNumber);
    map['tax_id'] = Variable<String>(taxId);
    map['tax_name'] = Variable<String>(taxName);
    map['tax_percent'] = Variable<double>(taxPercent);
    map['exclude_goods'] = Variable<bool>(excludeGoods);
    map['local_created_at'] = Variable<DateTime>(localCreatedAt);
    map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    return map;
  }

  TaxTableCompanion toCompanion(bool nullToAbsent) {
    return TaxTableCompanion(
      id: Value(id),
      autoNumber: Value(autoNumber),
      taxId: Value(taxId),
      taxName: Value(taxName),
      taxPercent: Value(taxPercent),
      excludeGoods: Value(excludeGoods),
      localCreatedAt: Value(localCreatedAt),
      localUpdatedAt: Value(localUpdatedAt),
    );
  }

  factory TaxDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxDataClass(
      id: serializer.fromJson<int>(json['id']),
      autoNumber: serializer.fromJson<int>(json['autoNumber']),
      taxId: serializer.fromJson<String>(json['taxId']),
      taxName: serializer.fromJson<String>(json['taxName']),
      taxPercent: serializer.fromJson<double>(json['taxPercent']),
      excludeGoods: serializer.fromJson<bool>(json['excludeGoods']),
      localCreatedAt: serializer.fromJson<DateTime>(json['localCreatedAt']),
      localUpdatedAt: serializer.fromJson<DateTime>(json['localUpdatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'autoNumber': serializer.toJson<int>(autoNumber),
      'taxId': serializer.toJson<String>(taxId),
      'taxName': serializer.toJson<String>(taxName),
      'taxPercent': serializer.toJson<double>(taxPercent),
      'excludeGoods': serializer.toJson<bool>(excludeGoods),
      'localCreatedAt': serializer.toJson<DateTime>(localCreatedAt),
      'localUpdatedAt': serializer.toJson<DateTime>(localUpdatedAt),
    };
  }

  TaxDataClass copyWith(
          {int? id,
          int? autoNumber,
          String? taxId,
          String? taxName,
          double? taxPercent,
          bool? excludeGoods,
          DateTime? localCreatedAt,
          DateTime? localUpdatedAt}) =>
      TaxDataClass(
        id: id ?? this.id,
        autoNumber: autoNumber ?? this.autoNumber,
        taxId: taxId ?? this.taxId,
        taxName: taxName ?? this.taxName,
        taxPercent: taxPercent ?? this.taxPercent,
        excludeGoods: excludeGoods ?? this.excludeGoods,
        localCreatedAt: localCreatedAt ?? this.localCreatedAt,
        localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TaxDataClass(')
          ..write('id: $id, ')
          ..write('autoNumber: $autoNumber, ')
          ..write('taxId: $taxId, ')
          ..write('taxName: $taxName, ')
          ..write('taxPercent: $taxPercent, ')
          ..write('excludeGoods: $excludeGoods, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, autoNumber, taxId, taxName, taxPercent,
      excludeGoods, localCreatedAt, localUpdatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxDataClass &&
          other.id == this.id &&
          other.autoNumber == this.autoNumber &&
          other.taxId == this.taxId &&
          other.taxName == this.taxName &&
          other.taxPercent == this.taxPercent &&
          other.excludeGoods == this.excludeGoods &&
          other.localCreatedAt == this.localCreatedAt &&
          other.localUpdatedAt == this.localUpdatedAt);
}

class TaxTableCompanion extends UpdateCompanion<TaxDataClass> {
  final Value<int> id;
  final Value<int> autoNumber;
  final Value<String> taxId;
  final Value<String> taxName;
  final Value<double> taxPercent;
  final Value<bool> excludeGoods;
  final Value<DateTime> localCreatedAt;
  final Value<DateTime> localUpdatedAt;
  const TaxTableCompanion({
    this.id = const Value.absent(),
    this.autoNumber = const Value.absent(),
    this.taxId = const Value.absent(),
    this.taxName = const Value.absent(),
    this.taxPercent = const Value.absent(),
    this.excludeGoods = const Value.absent(),
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  });
  TaxTableCompanion.insert({
    this.id = const Value.absent(),
    required int autoNumber,
    required String taxId,
    required String taxName,
    required double taxPercent,
    required bool excludeGoods,
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  })  : autoNumber = Value(autoNumber),
        taxId = Value(taxId),
        taxName = Value(taxName),
        taxPercent = Value(taxPercent),
        excludeGoods = Value(excludeGoods);
  static Insertable<TaxDataClass> custom({
    Expression<int>? id,
    Expression<int>? autoNumber,
    Expression<String>? taxId,
    Expression<String>? taxName,
    Expression<double>? taxPercent,
    Expression<bool>? excludeGoods,
    Expression<DateTime>? localCreatedAt,
    Expression<DateTime>? localUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (autoNumber != null) 'auto_number': autoNumber,
      if (taxId != null) 'tax_id': taxId,
      if (taxName != null) 'tax_name': taxName,
      if (taxPercent != null) 'tax_percent': taxPercent,
      if (excludeGoods != null) 'exclude_goods': excludeGoods,
      if (localCreatedAt != null) 'local_created_at': localCreatedAt,
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
    });
  }

  TaxTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? autoNumber,
      Value<String>? taxId,
      Value<String>? taxName,
      Value<double>? taxPercent,
      Value<bool>? excludeGoods,
      Value<DateTime>? localCreatedAt,
      Value<DateTime>? localUpdatedAt}) {
    return TaxTableCompanion(
      id: id ?? this.id,
      autoNumber: autoNumber ?? this.autoNumber,
      taxId: taxId ?? this.taxId,
      taxName: taxName ?? this.taxName,
      taxPercent: taxPercent ?? this.taxPercent,
      excludeGoods: excludeGoods ?? this.excludeGoods,
      localCreatedAt: localCreatedAt ?? this.localCreatedAt,
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (autoNumber.present) {
      map['auto_number'] = Variable<int>(autoNumber.value);
    }
    if (taxId.present) {
      map['tax_id'] = Variable<String>(taxId.value);
    }
    if (taxName.present) {
      map['tax_name'] = Variable<String>(taxName.value);
    }
    if (taxPercent.present) {
      map['tax_percent'] = Variable<double>(taxPercent.value);
    }
    if (excludeGoods.present) {
      map['exclude_goods'] = Variable<bool>(excludeGoods.value);
    }
    if (localCreatedAt.present) {
      map['local_created_at'] = Variable<DateTime>(localCreatedAt.value);
    }
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxTableCompanion(')
          ..write('id: $id, ')
          ..write('autoNumber: $autoNumber, ')
          ..write('taxId: $taxId, ')
          ..write('taxName: $taxName, ')
          ..write('taxPercent: $taxPercent, ')
          ..write('excludeGoods: $excludeGoods, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }
}

class $TaxTableTable extends TaxTable
    with TableInfo<$TaxTableTable, TaxDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TaxTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _autoNumberMeta = const VerificationMeta('autoNumber');
  @override
  late final GeneratedColumn<int?> autoNumber = GeneratedColumn<int?>(
      'auto_number', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _taxIdMeta = const VerificationMeta('taxId');
  @override
  late final GeneratedColumn<String?> taxId = GeneratedColumn<String?>(
      'tax_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _taxNameMeta = const VerificationMeta('taxName');
  @override
  late final GeneratedColumn<String?> taxName = GeneratedColumn<String?>(
      'tax_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _taxPercentMeta = const VerificationMeta('taxPercent');
  @override
  late final GeneratedColumn<double?> taxPercent = GeneratedColumn<double?>(
      'tax_percent', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _excludeGoodsMeta =
      const VerificationMeta('excludeGoods');
  @override
  late final GeneratedColumn<bool?> excludeGoods = GeneratedColumn<bool?>(
      'exclude_goods', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (exclude_goods IN (0, 1))');
  final VerificationMeta _localCreatedAtMeta =
      const VerificationMeta('localCreatedAt');
  @override
  late final GeneratedColumn<DateTime?> localCreatedAt =
      GeneratedColumn<DateTime?>('local_created_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  final VerificationMeta _localUpdatedAtMeta =
      const VerificationMeta('localUpdatedAt');
  @override
  late final GeneratedColumn<DateTime?> localUpdatedAt =
      GeneratedColumn<DateTime?>('local_updated_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        autoNumber,
        taxId,
        taxName,
        taxPercent,
        excludeGoods,
        localCreatedAt,
        localUpdatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'tax_table';
  @override
  String get actualTableName => 'tax_table';
  @override
  VerificationContext validateIntegrity(Insertable<TaxDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('auto_number')) {
      context.handle(
          _autoNumberMeta,
          autoNumber.isAcceptableOrUnknown(
              data['auto_number']!, _autoNumberMeta));
    } else if (isInserting) {
      context.missing(_autoNumberMeta);
    }
    if (data.containsKey('tax_id')) {
      context.handle(
          _taxIdMeta, taxId.isAcceptableOrUnknown(data['tax_id']!, _taxIdMeta));
    } else if (isInserting) {
      context.missing(_taxIdMeta);
    }
    if (data.containsKey('tax_name')) {
      context.handle(_taxNameMeta,
          taxName.isAcceptableOrUnknown(data['tax_name']!, _taxNameMeta));
    } else if (isInserting) {
      context.missing(_taxNameMeta);
    }
    if (data.containsKey('tax_percent')) {
      context.handle(
          _taxPercentMeta,
          taxPercent.isAcceptableOrUnknown(
              data['tax_percent']!, _taxPercentMeta));
    } else if (isInserting) {
      context.missing(_taxPercentMeta);
    }
    if (data.containsKey('exclude_goods')) {
      context.handle(
          _excludeGoodsMeta,
          excludeGoods.isAcceptableOrUnknown(
              data['exclude_goods']!, _excludeGoodsMeta));
    } else if (isInserting) {
      context.missing(_excludeGoodsMeta);
    }
    if (data.containsKey('local_created_at')) {
      context.handle(
          _localCreatedAtMeta,
          localCreatedAt.isAcceptableOrUnknown(
              data['local_created_at']!, _localCreatedAtMeta));
    }
    if (data.containsKey('local_updated_at')) {
      context.handle(
          _localUpdatedAtMeta,
          localUpdatedAt.isAcceptableOrUnknown(
              data['local_updated_at']!, _localUpdatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaxDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TaxDataClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TaxTableTable createAlias(String alias) {
    return $TaxTableTable(_db, alias);
  }
}

class StockDataClass extends DataClass implements Insertable<StockDataClass> {
  final int id;
  final int autoNumber;
  final DateTime transactionDate;
  final String itemcode;
  final String itemname;
  final String description;
  final String batchnumber;
  final double batchQauntity;
  final double transactionQauntity;
  final double cumulativeQauntity;
  final double availableQuantity;
  final double rate;
  final double masterRate;
  final double totalprice;
  final double closing;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime localCreatedAt;
  final DateTime localUpdatedAt;
  StockDataClass(
      {required this.id,
      required this.autoNumber,
      required this.transactionDate,
      required this.itemcode,
      required this.itemname,
      required this.description,
      required this.batchnumber,
      required this.batchQauntity,
      required this.transactionQauntity,
      required this.cumulativeQauntity,
      required this.availableQuantity,
      required this.rate,
      required this.masterRate,
      required this.totalprice,
      required this.closing,
      required this.createdAt,
      required this.updatedAt,
      required this.localCreatedAt,
      required this.localUpdatedAt});
  factory StockDataClass.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return StockDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      autoNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}auto_number'])!,
      transactionDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_date'])!,
      itemcode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}itemcode'])!,
      itemname: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}itemname'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      batchnumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}batchnumber'])!,
      batchQauntity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}batch_qauntity'])!,
      transactionQauntity: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}transaction_qauntity'])!,
      cumulativeQauntity: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}cumulative_qauntity'])!,
      availableQuantity: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}available_quantity'])!,
      rate: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rate'])!,
      masterRate: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}master_rate'])!,
      totalprice: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}totalprice'])!,
      closing: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}closing'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      localCreatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_created_at'])!,
      localUpdatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['auto_number'] = Variable<int>(autoNumber);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['itemcode'] = Variable<String>(itemcode);
    map['itemname'] = Variable<String>(itemname);
    map['description'] = Variable<String>(description);
    map['batchnumber'] = Variable<String>(batchnumber);
    map['batch_qauntity'] = Variable<double>(batchQauntity);
    map['transaction_qauntity'] = Variable<double>(transactionQauntity);
    map['cumulative_qauntity'] = Variable<double>(cumulativeQauntity);
    map['available_quantity'] = Variable<double>(availableQuantity);
    map['rate'] = Variable<double>(rate);
    map['master_rate'] = Variable<double>(masterRate);
    map['totalprice'] = Variable<double>(totalprice);
    map['closing'] = Variable<double>(closing);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['local_created_at'] = Variable<DateTime>(localCreatedAt);
    map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    return map;
  }

  StockTableCompanion toCompanion(bool nullToAbsent) {
    return StockTableCompanion(
      id: Value(id),
      autoNumber: Value(autoNumber),
      transactionDate: Value(transactionDate),
      itemcode: Value(itemcode),
      itemname: Value(itemname),
      description: Value(description),
      batchnumber: Value(batchnumber),
      batchQauntity: Value(batchQauntity),
      transactionQauntity: Value(transactionQauntity),
      cumulativeQauntity: Value(cumulativeQauntity),
      availableQuantity: Value(availableQuantity),
      rate: Value(rate),
      masterRate: Value(masterRate),
      totalprice: Value(totalprice),
      closing: Value(closing),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      localCreatedAt: Value(localCreatedAt),
      localUpdatedAt: Value(localUpdatedAt),
    );
  }

  factory StockDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockDataClass(
      id: serializer.fromJson<int>(json['id']),
      autoNumber: serializer.fromJson<int>(json['autoNumber']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      itemcode: serializer.fromJson<String>(json['itemcode']),
      itemname: serializer.fromJson<String>(json['itemname']),
      description: serializer.fromJson<String>(json['description']),
      batchnumber: serializer.fromJson<String>(json['batchnumber']),
      batchQauntity: serializer.fromJson<double>(json['batchQauntity']),
      transactionQauntity:
          serializer.fromJson<double>(json['transactionQauntity']),
      cumulativeQauntity:
          serializer.fromJson<double>(json['cumulativeQauntity']),
      availableQuantity: serializer.fromJson<double>(json['availableQuantity']),
      rate: serializer.fromJson<double>(json['rate']),
      masterRate: serializer.fromJson<double>(json['masterRate']),
      totalprice: serializer.fromJson<double>(json['totalprice']),
      closing: serializer.fromJson<double>(json['closing']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      localCreatedAt: serializer.fromJson<DateTime>(json['localCreatedAt']),
      localUpdatedAt: serializer.fromJson<DateTime>(json['localUpdatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'autoNumber': serializer.toJson<int>(autoNumber),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'itemcode': serializer.toJson<String>(itemcode),
      'itemname': serializer.toJson<String>(itemname),
      'description': serializer.toJson<String>(description),
      'batchnumber': serializer.toJson<String>(batchnumber),
      'batchQauntity': serializer.toJson<double>(batchQauntity),
      'transactionQauntity': serializer.toJson<double>(transactionQauntity),
      'cumulativeQauntity': serializer.toJson<double>(cumulativeQauntity),
      'availableQuantity': serializer.toJson<double>(availableQuantity),
      'rate': serializer.toJson<double>(rate),
      'masterRate': serializer.toJson<double>(masterRate),
      'totalprice': serializer.toJson<double>(totalprice),
      'closing': serializer.toJson<double>(closing),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'localCreatedAt': serializer.toJson<DateTime>(localCreatedAt),
      'localUpdatedAt': serializer.toJson<DateTime>(localUpdatedAt),
    };
  }

  StockDataClass copyWith(
          {int? id,
          int? autoNumber,
          DateTime? transactionDate,
          String? itemcode,
          String? itemname,
          String? description,
          String? batchnumber,
          double? batchQauntity,
          double? transactionQauntity,
          double? cumulativeQauntity,
          double? availableQuantity,
          double? rate,
          double? masterRate,
          double? totalprice,
          double? closing,
          DateTime? createdAt,
          DateTime? updatedAt,
          DateTime? localCreatedAt,
          DateTime? localUpdatedAt}) =>
      StockDataClass(
        id: id ?? this.id,
        autoNumber: autoNumber ?? this.autoNumber,
        transactionDate: transactionDate ?? this.transactionDate,
        itemcode: itemcode ?? this.itemcode,
        itemname: itemname ?? this.itemname,
        description: description ?? this.description,
        batchnumber: batchnumber ?? this.batchnumber,
        batchQauntity: batchQauntity ?? this.batchQauntity,
        transactionQauntity: transactionQauntity ?? this.transactionQauntity,
        cumulativeQauntity: cumulativeQauntity ?? this.cumulativeQauntity,
        availableQuantity: availableQuantity ?? this.availableQuantity,
        rate: rate ?? this.rate,
        masterRate: masterRate ?? this.masterRate,
        totalprice: totalprice ?? this.totalprice,
        closing: closing ?? this.closing,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        localCreatedAt: localCreatedAt ?? this.localCreatedAt,
        localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('StockDataClass(')
          ..write('id: $id, ')
          ..write('autoNumber: $autoNumber, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('itemcode: $itemcode, ')
          ..write('itemname: $itemname, ')
          ..write('description: $description, ')
          ..write('batchnumber: $batchnumber, ')
          ..write('batchQauntity: $batchQauntity, ')
          ..write('transactionQauntity: $transactionQauntity, ')
          ..write('cumulativeQauntity: $cumulativeQauntity, ')
          ..write('availableQuantity: $availableQuantity, ')
          ..write('rate: $rate, ')
          ..write('masterRate: $masterRate, ')
          ..write('totalprice: $totalprice, ')
          ..write('closing: $closing, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      autoNumber,
      transactionDate,
      itemcode,
      itemname,
      description,
      batchnumber,
      batchQauntity,
      transactionQauntity,
      cumulativeQauntity,
      availableQuantity,
      rate,
      masterRate,
      totalprice,
      closing,
      createdAt,
      updatedAt,
      localCreatedAt,
      localUpdatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockDataClass &&
          other.id == this.id &&
          other.autoNumber == this.autoNumber &&
          other.transactionDate == this.transactionDate &&
          other.itemcode == this.itemcode &&
          other.itemname == this.itemname &&
          other.description == this.description &&
          other.batchnumber == this.batchnumber &&
          other.batchQauntity == this.batchQauntity &&
          other.transactionQauntity == this.transactionQauntity &&
          other.cumulativeQauntity == this.cumulativeQauntity &&
          other.availableQuantity == this.availableQuantity &&
          other.rate == this.rate &&
          other.masterRate == this.masterRate &&
          other.totalprice == this.totalprice &&
          other.closing == this.closing &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.localCreatedAt == this.localCreatedAt &&
          other.localUpdatedAt == this.localUpdatedAt);
}

class StockTableCompanion extends UpdateCompanion<StockDataClass> {
  final Value<int> id;
  final Value<int> autoNumber;
  final Value<DateTime> transactionDate;
  final Value<String> itemcode;
  final Value<String> itemname;
  final Value<String> description;
  final Value<String> batchnumber;
  final Value<double> batchQauntity;
  final Value<double> transactionQauntity;
  final Value<double> cumulativeQauntity;
  final Value<double> availableQuantity;
  final Value<double> rate;
  final Value<double> masterRate;
  final Value<double> totalprice;
  final Value<double> closing;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> localCreatedAt;
  final Value<DateTime> localUpdatedAt;
  const StockTableCompanion({
    this.id = const Value.absent(),
    this.autoNumber = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.itemcode = const Value.absent(),
    this.itemname = const Value.absent(),
    this.description = const Value.absent(),
    this.batchnumber = const Value.absent(),
    this.batchQauntity = const Value.absent(),
    this.transactionQauntity = const Value.absent(),
    this.cumulativeQauntity = const Value.absent(),
    this.availableQuantity = const Value.absent(),
    this.rate = const Value.absent(),
    this.masterRate = const Value.absent(),
    this.totalprice = const Value.absent(),
    this.closing = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  });
  StockTableCompanion.insert({
    this.id = const Value.absent(),
    required int autoNumber,
    required DateTime transactionDate,
    required String itemcode,
    required String itemname,
    required String description,
    required String batchnumber,
    required double batchQauntity,
    required double transactionQauntity,
    required double cumulativeQauntity,
    required double availableQuantity,
    required double rate,
    required double masterRate,
    required double totalprice,
    required double closing,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
  })  : autoNumber = Value(autoNumber),
        transactionDate = Value(transactionDate),
        itemcode = Value(itemcode),
        itemname = Value(itemname),
        description = Value(description),
        batchnumber = Value(batchnumber),
        batchQauntity = Value(batchQauntity),
        transactionQauntity = Value(transactionQauntity),
        cumulativeQauntity = Value(cumulativeQauntity),
        availableQuantity = Value(availableQuantity),
        rate = Value(rate),
        masterRate = Value(masterRate),
        totalprice = Value(totalprice),
        closing = Value(closing),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<StockDataClass> custom({
    Expression<int>? id,
    Expression<int>? autoNumber,
    Expression<DateTime>? transactionDate,
    Expression<String>? itemcode,
    Expression<String>? itemname,
    Expression<String>? description,
    Expression<String>? batchnumber,
    Expression<double>? batchQauntity,
    Expression<double>? transactionQauntity,
    Expression<double>? cumulativeQauntity,
    Expression<double>? availableQuantity,
    Expression<double>? rate,
    Expression<double>? masterRate,
    Expression<double>? totalprice,
    Expression<double>? closing,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? localCreatedAt,
    Expression<DateTime>? localUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (autoNumber != null) 'auto_number': autoNumber,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (itemcode != null) 'itemcode': itemcode,
      if (itemname != null) 'itemname': itemname,
      if (description != null) 'description': description,
      if (batchnumber != null) 'batchnumber': batchnumber,
      if (batchQauntity != null) 'batch_qauntity': batchQauntity,
      if (transactionQauntity != null)
        'transaction_qauntity': transactionQauntity,
      if (cumulativeQauntity != null) 'cumulative_qauntity': cumulativeQauntity,
      if (availableQuantity != null) 'available_quantity': availableQuantity,
      if (rate != null) 'rate': rate,
      if (masterRate != null) 'master_rate': masterRate,
      if (totalprice != null) 'totalprice': totalprice,
      if (closing != null) 'closing': closing,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (localCreatedAt != null) 'local_created_at': localCreatedAt,
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
    });
  }

  StockTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? autoNumber,
      Value<DateTime>? transactionDate,
      Value<String>? itemcode,
      Value<String>? itemname,
      Value<String>? description,
      Value<String>? batchnumber,
      Value<double>? batchQauntity,
      Value<double>? transactionQauntity,
      Value<double>? cumulativeQauntity,
      Value<double>? availableQuantity,
      Value<double>? rate,
      Value<double>? masterRate,
      Value<double>? totalprice,
      Value<double>? closing,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime>? localCreatedAt,
      Value<DateTime>? localUpdatedAt}) {
    return StockTableCompanion(
      id: id ?? this.id,
      autoNumber: autoNumber ?? this.autoNumber,
      transactionDate: transactionDate ?? this.transactionDate,
      itemcode: itemcode ?? this.itemcode,
      itemname: itemname ?? this.itemname,
      description: description ?? this.description,
      batchnumber: batchnumber ?? this.batchnumber,
      batchQauntity: batchQauntity ?? this.batchQauntity,
      transactionQauntity: transactionQauntity ?? this.transactionQauntity,
      cumulativeQauntity: cumulativeQauntity ?? this.cumulativeQauntity,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      rate: rate ?? this.rate,
      masterRate: masterRate ?? this.masterRate,
      totalprice: totalprice ?? this.totalprice,
      closing: closing ?? this.closing,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      localCreatedAt: localCreatedAt ?? this.localCreatedAt,
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (autoNumber.present) {
      map['auto_number'] = Variable<int>(autoNumber.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (itemcode.present) {
      map['itemcode'] = Variable<String>(itemcode.value);
    }
    if (itemname.present) {
      map['itemname'] = Variable<String>(itemname.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (batchnumber.present) {
      map['batchnumber'] = Variable<String>(batchnumber.value);
    }
    if (batchQauntity.present) {
      map['batch_qauntity'] = Variable<double>(batchQauntity.value);
    }
    if (transactionQauntity.present) {
      map['transaction_qauntity'] = Variable<double>(transactionQauntity.value);
    }
    if (cumulativeQauntity.present) {
      map['cumulative_qauntity'] = Variable<double>(cumulativeQauntity.value);
    }
    if (availableQuantity.present) {
      map['available_quantity'] = Variable<double>(availableQuantity.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (masterRate.present) {
      map['master_rate'] = Variable<double>(masterRate.value);
    }
    if (totalprice.present) {
      map['totalprice'] = Variable<double>(totalprice.value);
    }
    if (closing.present) {
      map['closing'] = Variable<double>(closing.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (localCreatedAt.present) {
      map['local_created_at'] = Variable<DateTime>(localCreatedAt.value);
    }
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockTableCompanion(')
          ..write('id: $id, ')
          ..write('autoNumber: $autoNumber, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('itemcode: $itemcode, ')
          ..write('itemname: $itemname, ')
          ..write('description: $description, ')
          ..write('batchnumber: $batchnumber, ')
          ..write('batchQauntity: $batchQauntity, ')
          ..write('transactionQauntity: $transactionQauntity, ')
          ..write('cumulativeQauntity: $cumulativeQauntity, ')
          ..write('availableQuantity: $availableQuantity, ')
          ..write('rate: $rate, ')
          ..write('masterRate: $masterRate, ')
          ..write('totalprice: $totalprice, ')
          ..write('closing: $closing, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt')
          ..write(')'))
        .toString();
  }
}

class $StockTableTable extends StockTable
    with TableInfo<$StockTableTable, StockDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $StockTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _autoNumberMeta = const VerificationMeta('autoNumber');
  @override
  late final GeneratedColumn<int?> autoNumber = GeneratedColumn<int?>(
      'auto_number', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedColumn<DateTime?> transactionDate =
      GeneratedColumn<DateTime?>('transaction_date', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _itemcodeMeta = const VerificationMeta('itemcode');
  @override
  late final GeneratedColumn<String?> itemcode = GeneratedColumn<String?>(
      'itemcode', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _itemnameMeta = const VerificationMeta('itemname');
  @override
  late final GeneratedColumn<String?> itemname = GeneratedColumn<String?>(
      'itemname', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _batchnumberMeta =
      const VerificationMeta('batchnumber');
  @override
  late final GeneratedColumn<String?> batchnumber = GeneratedColumn<String?>(
      'batchnumber', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _batchQauntityMeta =
      const VerificationMeta('batchQauntity');
  @override
  late final GeneratedColumn<double?> batchQauntity = GeneratedColumn<double?>(
      'batch_qauntity', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _transactionQauntityMeta =
      const VerificationMeta('transactionQauntity');
  @override
  late final GeneratedColumn<double?> transactionQauntity =
      GeneratedColumn<double?>('transaction_qauntity', aliasedName, false,
          typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _cumulativeQauntityMeta =
      const VerificationMeta('cumulativeQauntity');
  @override
  late final GeneratedColumn<double?> cumulativeQauntity =
      GeneratedColumn<double?>('cumulative_qauntity', aliasedName, false,
          typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _availableQuantityMeta =
      const VerificationMeta('availableQuantity');
  @override
  late final GeneratedColumn<double?> availableQuantity =
      GeneratedColumn<double?>('available_quantity', aliasedName, false,
          typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double?> rate = GeneratedColumn<double?>(
      'rate', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _masterRateMeta = const VerificationMeta('masterRate');
  @override
  late final GeneratedColumn<double?> masterRate = GeneratedColumn<double?>(
      'master_rate', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _totalpriceMeta = const VerificationMeta('totalprice');
  @override
  late final GeneratedColumn<double?> totalprice = GeneratedColumn<double?>(
      'totalprice', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _closingMeta = const VerificationMeta('closing');
  @override
  late final GeneratedColumn<double?> closing = GeneratedColumn<double?>(
      'closing', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _localCreatedAtMeta =
      const VerificationMeta('localCreatedAt');
  @override
  late final GeneratedColumn<DateTime?> localCreatedAt =
      GeneratedColumn<DateTime?>('local_created_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  final VerificationMeta _localUpdatedAtMeta =
      const VerificationMeta('localUpdatedAt');
  @override
  late final GeneratedColumn<DateTime?> localUpdatedAt =
      GeneratedColumn<DateTime?>('local_updated_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        autoNumber,
        transactionDate,
        itemcode,
        itemname,
        description,
        batchnumber,
        batchQauntity,
        transactionQauntity,
        cumulativeQauntity,
        availableQuantity,
        rate,
        masterRate,
        totalprice,
        closing,
        createdAt,
        updatedAt,
        localCreatedAt,
        localUpdatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'stock_table';
  @override
  String get actualTableName => 'stock_table';
  @override
  VerificationContext validateIntegrity(Insertable<StockDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('auto_number')) {
      context.handle(
          _autoNumberMeta,
          autoNumber.isAcceptableOrUnknown(
              data['auto_number']!, _autoNumberMeta));
    } else if (isInserting) {
      context.missing(_autoNumberMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('itemcode')) {
      context.handle(_itemcodeMeta,
          itemcode.isAcceptableOrUnknown(data['itemcode']!, _itemcodeMeta));
    } else if (isInserting) {
      context.missing(_itemcodeMeta);
    }
    if (data.containsKey('itemname')) {
      context.handle(_itemnameMeta,
          itemname.isAcceptableOrUnknown(data['itemname']!, _itemnameMeta));
    } else if (isInserting) {
      context.missing(_itemnameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('batchnumber')) {
      context.handle(
          _batchnumberMeta,
          batchnumber.isAcceptableOrUnknown(
              data['batchnumber']!, _batchnumberMeta));
    } else if (isInserting) {
      context.missing(_batchnumberMeta);
    }
    if (data.containsKey('batch_qauntity')) {
      context.handle(
          _batchQauntityMeta,
          batchQauntity.isAcceptableOrUnknown(
              data['batch_qauntity']!, _batchQauntityMeta));
    } else if (isInserting) {
      context.missing(_batchQauntityMeta);
    }
    if (data.containsKey('transaction_qauntity')) {
      context.handle(
          _transactionQauntityMeta,
          transactionQauntity.isAcceptableOrUnknown(
              data['transaction_qauntity']!, _transactionQauntityMeta));
    } else if (isInserting) {
      context.missing(_transactionQauntityMeta);
    }
    if (data.containsKey('cumulative_qauntity')) {
      context.handle(
          _cumulativeQauntityMeta,
          cumulativeQauntity.isAcceptableOrUnknown(
              data['cumulative_qauntity']!, _cumulativeQauntityMeta));
    } else if (isInserting) {
      context.missing(_cumulativeQauntityMeta);
    }
    if (data.containsKey('available_quantity')) {
      context.handle(
          _availableQuantityMeta,
          availableQuantity.isAcceptableOrUnknown(
              data['available_quantity']!, _availableQuantityMeta));
    } else if (isInserting) {
      context.missing(_availableQuantityMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('master_rate')) {
      context.handle(
          _masterRateMeta,
          masterRate.isAcceptableOrUnknown(
              data['master_rate']!, _masterRateMeta));
    } else if (isInserting) {
      context.missing(_masterRateMeta);
    }
    if (data.containsKey('totalprice')) {
      context.handle(
          _totalpriceMeta,
          totalprice.isAcceptableOrUnknown(
              data['totalprice']!, _totalpriceMeta));
    } else if (isInserting) {
      context.missing(_totalpriceMeta);
    }
    if (data.containsKey('closing')) {
      context.handle(_closingMeta,
          closing.isAcceptableOrUnknown(data['closing']!, _closingMeta));
    } else if (isInserting) {
      context.missing(_closingMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('local_created_at')) {
      context.handle(
          _localCreatedAtMeta,
          localCreatedAt.isAcceptableOrUnknown(
              data['local_created_at']!, _localCreatedAtMeta));
    }
    if (data.containsKey('local_updated_at')) {
      context.handle(
          _localUpdatedAtMeta,
          localUpdatedAt.isAcceptableOrUnknown(
              data['local_updated_at']!, _localUpdatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return StockDataClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $StockTableTable createAlias(String alias) {
    return $StockTableTable(_db, alias);
  }
}

//BillingItemTeble _db
class BillingItemClass extends DataClass
    implements Insertable<BillingItemClass> {
  final int stockItemId;
  final double quantity;
  final double unitPrice;
  final String stockItemCode;
  BillingItemClass(
      {required this.stockItemId,
      required this.quantity,
      required this.unitPrice,
      required this.stockItemCode});
  factory BillingItemClass.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BillingItemClass(
        stockItemId: const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}stock_item_id'])!,
        quantity: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
        unitPrice: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}unit_price'])!,
        stockItemCode: const StringType().mapFromDatabaseResponse(
            data['${effectivePrefix}stock_item_code'])!);
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['stock_item_id'] = Variable<int>(stockItemId);
    map['quantity'] = Variable<double>(quantity);
    map['unit_price'] = Variable<double>(unitPrice);
    map['stock_item_code'] = Variable<String>(stockItemCode);
    return map;
  }

  BillingItemTableCompanion toCompanion(bool nullToAbsent) {
    return BillingItemTableCompanion(
      stockItemId: Value(stockItemId),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      stockItemCode: Value(stockItemCode),
    );
  }

  factory BillingItemClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BillingItemClass(
      stockItemId: serializer.fromJson<int>(json['stockItemId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      stockItemCode: serializer.fromJson<String>(json['stockItemCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'stockItemId': serializer.toJson<int>(stockItemId),
      'quantity': serializer.toJson<double>(quantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'stockItemCode': serializer.toJson<String>(stockItemCode),
    };
  }

  BillingItemClass copyWith(
          {int? stockItemId,
          double? quantity,
          double? unitPrice,
          String? stockItemCode}) =>
      BillingItemClass(
        stockItemId: stockItemId ?? this.stockItemId,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        stockItemCode: stockItemCode ?? this.stockItemCode,
      );
  @override
  String toString() {
    return (StringBuffer('BillingItemClass(')
          ..write('stockItemId: $stockItemId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice')
          ..write('stockItemCode: $stockItemCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(stockItemId, quantity, unitPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BillingItemClass &&
          other.stockItemId == this.stockItemId &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.stockItemCode == this.stockItemCode);
}

class BillingItemTableCompanion extends UpdateCompanion<BillingItemClass> {
  final Value<int> stockItemId;
  final Value<double> quantity;
  final Value<double> unitPrice;
  final Value<String> stockItemCode;
  const BillingItemTableCompanion(
      {this.stockItemId = const Value.absent(),
      this.quantity = const Value.absent(),
      this.unitPrice = const Value.absent(),
      this.stockItemCode = const Value.absent()});
  BillingItemTableCompanion.insert(
      {this.stockItemId = const Value.absent(),
      this.quantity = const Value.absent(),
      this.unitPrice = const Value.absent(),
      this.stockItemCode = const Value.absent()});
  static Insertable<BillingItemClass> custom({
    Expression<int>? stockItemId,
    Expression<double>? quantity,
    Expression<double>? unitPrice,
    Expression<double>? stockItemCode,
  }) {
    return RawValuesInsertable({
      if (stockItemId != null) 'stock_item_id': stockItemId,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (stockItemCode != null) 'stock_item_code': stockItemCode,
    });
  }

  BillingItemTableCompanion copyWith(
      {Value<int>? stockItemId,
      Value<double>? quantity,
      Value<double>? unitPrice,
      Value<String>? stockItemCode}) {
    return BillingItemTableCompanion(
      stockItemId: stockItemId ?? this.stockItemId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      stockItemCode: stockItemCode ?? this.stockItemCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (stockItemId.present) {
      map['stock_item_id'] = Variable<int>(stockItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (stockItemCode.present) {
      map['stock_item_code'] = Variable<String>(stockItemCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillingItemTableCompanion(')
          ..write('stockItemId: $stockItemId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice')
          ..write('stockItemCode: $stockItemCode')
          ..write(')'))
        .toString();
  }
}

class $BillingItemTableTable extends BillingItemTable
    with TableInfo<$BillingItemTableTable, BillingItemClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BillingItemTableTable(this._db, [this._alias]);
  final VerificationMeta _stockItemIdMeta =
      const VerificationMeta('stockItemId');
  @override
  late final GeneratedColumn<int?> stockItemId = GeneratedColumn<int?>(
      'stock_item_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double?> quantity = GeneratedColumn<double?>(
      'quantity', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(1.0));
  final VerificationMeta _unitPriceMeta = const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<double?> unitPrice = GeneratedColumn<double?>(
      'unit_price', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(1.0));

  final VerificationMeta _stockItemCodeMeta =
      const VerificationMeta('stockItemCode');
  @override
  late final GeneratedColumn<String?> stockItemCode = GeneratedColumn<String?>(
      'stock_item_code', aliasedName, false,
      typeName: 'STRING', requiredDuringInsert: false);

  @override
  List<GeneratedColumn> get $columns =>
      [stockItemId, quantity, unitPrice, stockItemCode];
  @override
  String get aliasedName => _alias ?? 'billing_item_table';
  @override
  String get actualTableName => 'billing_item_table';
  @override
  VerificationContext validateIntegrity(Insertable<BillingItemClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('stock_item_id')) {
      context.handle(
          _stockItemIdMeta,
          stockItemId.isAcceptableOrUnknown(
              data['stock_item_id']!, _stockItemIdMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    }
    if (data.containsKey('stock_item_code')) {
      context.handle(
          _stockItemCodeMeta,
          stockItemCode.isAcceptableOrUnknown(
              data['stock_item_code']!, _stockItemCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {stockItemId};
  @override
  BillingItemClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BillingItemClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BillingItemTableTable createAlias(String alias) {
    return $BillingItemTableTable(_db, alias);
  }
}

//TransactionTable _db
class TransactionClass extends DataClass
    implements Insertable<TransactionClass> {
  final int id;
  final String transactionId;
  final double total;
  final double tax;
  final double subtotal;
  final String customerId;
  final String customerName;
  final int customerPhone;
  final String customerEmail;
  final String paymentMethod;

  final String invoiceId;
  TransactionClass({
    required this.id,
    required this.transactionId,
    required this.total,
    required this.tax,
    required this.subtotal,
    required this.customerId,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.invoiceId,
    required this.paymentMethod,
  });
  factory TransactionClass.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TransactionClass(
        id: const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
        transactionId: const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}transaction_id'])!,
        total: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}total'])!,
        tax: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}tax'])!,
        subtotal: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}subtotal'])!,
        customerId: const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}customer_id'])!,
        //Add Customer Table
        customerName: const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}customer_name'])!,
        customerEmail: const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}customer_email'])!,
        customerPhone: const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}customer_phone'])!,

        // TODO Add payment option String
        invoiceId: const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}invoice_id'])!,
        paymentMethod: const StringType().mapFromDatabaseResponse(
            data['${effectivePrefix}payment_method'])!);
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['transaction_id'] = Variable<String>(transactionId);
    map['total'] = Variable<double>(total);
    map['tax'] = Variable<double>(tax);
    map['subtotal'] = Variable<double>(subtotal);
    map['customer_id'] = Variable<String>(customerId);
    map['customer_name'] = Variable<String>(customerName);
    map['customer_email'] = Variable<String>(customerEmail);
    map['customer_phone'] = Variable<int>(customerPhone);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['payment_method'] = Variable<String>(paymentMethod);
    return map;
  }

  TransactionTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionTableCompanion(
        id: Value(id),
        transactionId: Value(transactionId),
        total: Value(total),
        tax: Value(tax),
        subtotal: Value(subtotal),
        customerId: Value(customerId),
        customerName: Value(customerName),
        customerEmail: Value(customerEmail),
        customerPhone: Value(customerPhone),
        invoiceId: Value(invoiceId),
        paymentMethod: Value(paymentMethod));
  }

  factory TransactionClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionClass(
        id: serializer.fromJson<int>(json['id']),
        transactionId: serializer.fromJson<String>(json['transactionId']),
        total: serializer.fromJson<double>(json['total']),
        tax: serializer.fromJson<double>(json['tax']),
        subtotal: serializer.fromJson<double>(json['subtotal']),
        customerId: serializer.fromJson<String>(json['customerId']),
        customerName: serializer.fromJson<String>(json['customerName']),
        customerEmail: serializer.fromJson<String>(json['customerEmail']),
        customerPhone: serializer.fromJson<int>(json['customerPhone']),
        invoiceId: serializer.fromJson<String>(json['invoiceId']),
        paymentMethod: serializer.fromJson<String>(json['paymentMethod']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionId': serializer.toJson<String>(transactionId),
      'total': serializer.toJson<double>(total),
      'tax': serializer.toJson<double>(tax),
      'subtotal': serializer.toJson<double>(subtotal),
      'customerId': serializer.toJson<String>(customerId),
      'customerName': serializer.toJson<String>(customerName),
      'customerEmail': serializer.toJson<String>(customerEmail),
      'customerPhone': serializer.toJson<int>(customerPhone),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'paymentMethod': serializer.toJson<String>(paymentMethod)
    };
  }

  TransactionClass copyWith({
    int? id,
    String? transactionId,
    double? total,
    double? tax,
    double? subtotal,
    String? customerId,
    String? customerName,
    String? customerEmail,
    int? customerPhone,
    String? invoiceId,
    String? paymentMethod,
  }) =>
      TransactionClass(
          id: id ?? this.id,
          transactionId: transactionId ?? this.transactionId,
          total: total ?? this.total,
          tax: tax ?? this.tax,
          subtotal: subtotal ?? this.subtotal,
          customerId: customerId ?? this.customerId,
          customerEmail: customerEmail ?? this.customerEmail,
          customerName: customerName ?? this.customerName,
          customerPhone: customerPhone ?? this.customerPhone,
          invoiceId: invoiceId ?? this.invoiceId,
          paymentMethod: paymentMethod ?? this.paymentMethod);
  @override
  String toString() {
    return (StringBuffer('TransactionClass(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('total: $total, ')
          ..write('tax: $tax, ')
          ..write('subtotal: $subtotal, ')
          ..write('customerId: $customerId, ')
          ..write('customerName: $customerName, ')
          ..write('customerEmail: $customerEmail, ')
          ..write('customerPhone: $customerPhone, ')
          ..write('invoiceId: $invoiceId')
          ..write('paymentMethod: $paymentMethod, ')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      transactionId,
      total,
      tax,
      subtotal,
      customerId,
      customerName,
      customerEmail,
      customerPhone,
      invoiceId,
      paymentMethod);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionClass &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.total == this.total &&
          other.tax == this.tax &&
          other.subtotal == this.subtotal &&
          other.customerId == this.customerId &&
          other.customerName == this.customerName &&
          other.customerName == this.customerName &&
          other.customerPhone == this.customerPhone &&
          other.invoiceId == this.invoiceId &&
          other.paymentMethod == this.paymentMethod);
}

class TransactionTableCompanion extends UpdateCompanion<TransactionClass> {
  final Value<int> id;
  final Value<String> transactionId;
  final Value<double> total;
  final Value<double> tax;
  final Value<double> subtotal;
  final Value<String> customerId;
  final Value<String> customerName;
  final Value<String> customerEmail;
  final Value<int> customerPhone;
  final Value<String> invoiceId;
  final Value<String> paymentMethod;

  const TransactionTableCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.total = const Value.absent(),
    this.tax = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.customerId = const Value.absent(),
    this.customerName = const Value.absent(),
    this.customerEmail = const Value.absent(),
    this.customerPhone = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
  });
  TransactionTableCompanion.insert({
    this.id = const Value.absent(),
    required String transactionId,
    this.total = const Value.absent(),
    this.tax = const Value.absent(),
    this.subtotal = const Value.absent(),
    required String customerId,
    this.customerEmail = const Value.absent(),
    this.customerName = const Value.absent(),
    this.customerPhone = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    required String invoiceId,
  })  : transactionId = Value(transactionId),
        customerId = Value(customerId),
        invoiceId = Value(invoiceId);
  static Insertable<TransactionClass> custom(
      {Expression<int>? id,
      Expression<String>? transactionId,
      Expression<double>? total,
      Expression<double>? tax,
      Expression<double>? subtotal,
      Expression<String>? customerId,
      Expression<String>? customerName,
      Expression<String>? customerEmail,
      Expression<int>? customerPhone,
      Expression<String>? invoiceId,
      Expression<String>? paymentMethod}) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (total != null) 'total': total,
      if (tax != null) 'tax': tax,
      if (subtotal != null) 'subtotal': subtotal,
      if (customerId != null) 'customer_id': customerId,
      if (customerName != null) 'customer_name': customerName,
      if (customerEmail != null) 'customer_email': customerEmail,
      if (customerPhone != null) 'customer_id': customerPhone,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (paymentMethod != null) 'payment_method': paymentMethod
    });
  }

  TransactionTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? transactionId,
      Value<double>? total,
      Value<double>? tax,
      Value<double>? subtotal,
      Value<String>? customerId,
      Value<String>? customerName,
      Value<String>? customerEmail,
      Value<int>? customerPhone,
      Value<String>? invoiceId,
      Value<String>? paymentMethod}) {
    return TransactionTableCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      total: total ?? this.total,
      tax: tax ?? this.tax,
      subtotal: subtotal ?? this.subtotal,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      customerEmail: customerEmail ?? this.customerEmail,
      customerPhone: customerPhone ?? this.customerPhone,
      invoiceId: invoiceId ?? this.invoiceId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (tax.present) {
      map['tax'] = Variable<double>(tax.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (customerEmail.present) {
      map['customer_email'] = Variable<String>(customerEmail.value);
    }
    if (customerPhone.present) {
      map['customer_phone'] = Variable<int>(customerPhone.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTableCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('total: $total, ')
          ..write('tax: $tax, ')
          ..write('subtotal: $subtotal, ')
          ..write('customerId: $customerId, ')
          ..write('customerName: $customerName, ')
          ..write('customerEmail: $customerEmail, ')
          ..write('customerPhone: $customerPhone, ')
          ..write('invoiceId: $invoiceId')
          ..write('paymentMethod: $paymentMethod, ')
          ..write(')'))
        .toString();
  }
}

class $TransactionTableTable extends TransactionTable
    with TableInfo<$TransactionTableTable, TransactionClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TransactionTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<String?> transactionId = GeneratedColumn<String?>(
      'transaction_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double?> total = GeneratedColumn<double?>(
      'total', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  final VerificationMeta _taxMeta = const VerificationMeta('tax');
  @override
  late final GeneratedColumn<double?> tax = GeneratedColumn<double?>(
      'tax', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  final VerificationMeta _subtotalMeta = const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double?> subtotal = GeneratedColumn<double?>(
      'subtotal', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  final VerificationMeta _customerIdMeta = const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<String?> customerId = GeneratedColumn<String?>(
      'customer_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String?> customerName = GeneratedColumn<String?>(
      'customer_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _customerEmailMeta =
      const VerificationMeta('customerEmail');
  @override
  late final GeneratedColumn<String?> customerEmail = GeneratedColumn<String?>(
      'customer_email', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _customerPhoneMeta =
      const VerificationMeta('customerPhone');
  @override
  late final GeneratedColumn<int?> customerPhone = GeneratedColumn<int?>(
      'customer_phone', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _invoiceIdMeta = const VerificationMeta('invoiceId');
  @override
  late final GeneratedColumn<String?> invoiceId = GeneratedColumn<String?>(
      'invoice_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);

  final VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String?> paymentMethod = GeneratedColumn<String?>(
      'payment_method', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: false);

  @override
  List<GeneratedColumn> get $columns => [
        id,
        transactionId,
        total,
        tax,
        subtotal,
        customerId,
        customerName,
        customerEmail,
        customerPhone,
        invoiceId,
        paymentMethod,
      ];
  @override
  String get aliasedName => _alias ?? 'transaction_table';
  @override
  String get actualTableName => 'transaction_table';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    }
    if (data.containsKey('tax')) {
      context.handle(
          _taxMeta, tax.isAcceptableOrUnknown(data['tax']!, _taxMeta));
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    }
    if (data.containsKey('customer_email')) {
      context.handle(
          _customerEmailMeta,
          customerEmail.isAcceptableOrUnknown(
              data['customer_email']!, _customerEmailMeta));
    }
    if (data.containsKey('customer_phone')) {
      context.handle(
          _customerPhoneMeta,
          customerPhone.isAcceptableOrUnknown(
              data['customer_phone']!, _customerPhoneMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(_invoiceIdMeta,
          invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta));
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else {
      context.missing(_paymentMethodMeta);
    }

    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TransactionClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TransactionTableTable createAlias(String alias) {
    return $TransactionTableTable(_db, alias);
  }
}

class InvoiceDataClass extends DataClass
    implements Insertable<InvoiceDataClass> {
  final int id;
  final String invoicenumber;
  final double total;
  final double tax;
  final double subtotal;
  final String customerId;
  final int productId;
  final double quantity;
  final double price;
  final String invoiceId;
  final String productCode;
  final DateTime createdAt;
  InvoiceDataClass(
      {required this.id,
      required this.invoicenumber,
      required this.total,
      required this.tax,
      required this.subtotal,
      required this.customerId,
      required this.productId,
      required this.quantity,
      required this.price,
      required this.invoiceId,
      required this.productCode,
      required this.createdAt});
  factory InvoiceDataClass.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return InvoiceDataClass(
        id: const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
        invoicenumber: const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}invoicenumber'])!,
        total: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}total'])!,
        tax: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}tax'])!,
        subtotal: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}subtotal'])!,
        customerId: const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}customer_id'])!,
        productId: const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}product_id'])!,
        quantity: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
        price: const RealType()
            .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
        invoiceId: const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}invoice_id'])!,
        productCode: const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}product_code'])!,
        createdAt: const DateTimeType()
            .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!);
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoicenumber'] = Variable<String>(invoicenumber);
    map['total'] = Variable<double>(total);
    map['tax'] = Variable<double>(tax);
    map['subtotal'] = Variable<double>(subtotal);
    map['customer_id'] = Variable<String>(customerId);
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<double>(quantity);
    map['price'] = Variable<double>(price);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['product_code'] = Variable<String>(productCode);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  InvoiceTableCompanion toCompanion(bool nullToAbsent) {
    return InvoiceTableCompanion(
      id: Value(id),
      invoicenumber: Value(invoicenumber),
      total: Value(total),
      tax: Value(tax),
      subtotal: Value(subtotal),
      customerId: Value(customerId),
      productId: Value(productId),
      quantity: Value(quantity),
      price: Value(price),
      invoiceId: Value(invoiceId),
      productCode: Value(productCode),
      createdAt: Value(createdAt),
    );
  }

  factory InvoiceDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceDataClass(
      id: serializer.fromJson<int>(json['id']),
      invoicenumber: serializer.fromJson<String>(json['invoicenumber']),
      total: serializer.fromJson<double>(json['total']),
      tax: serializer.fromJson<double>(json['tax']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      customerId: serializer.fromJson<String>(json['customerId']),
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      productCode: serializer.fromJson<String>(json['productCode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoicenumber': serializer.toJson<String>(invoicenumber),
      'total': serializer.toJson<double>(total),
      'tax': serializer.toJson<double>(tax),
      'subtotal': serializer.toJson<double>(subtotal),
      'customerId': serializer.toJson<String>(customerId),
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<double>(quantity),
      'price': serializer.toJson<double>(price),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'productCode': serializer.toJson<String>(productCode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  InvoiceDataClass copyWith(
          {int? id,
          String? invoicenumber,
          double? total,
          double? tax,
          double? subtotal,
          String? customerId,
          int? productId,
          double? quantity,
          double? price,
          String? invoiceId,
          String? productCode,
          DateTime? createdAt}) =>
      InvoiceDataClass(
        id: id ?? this.id,
        invoicenumber: invoicenumber ?? this.invoicenumber,
        total: total ?? this.total,
        tax: tax ?? this.tax,
        subtotal: subtotal ?? this.subtotal,
        customerId: customerId ?? this.customerId,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        invoiceId: invoiceId ?? this.invoiceId,
        productCode: productCode ?? this.productCode,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('InvoiceDataClass(')
          ..write('id: $id, ')
          ..write('invoicenumber: $invoicenumber, ')
          ..write('total: $total, ')
          ..write('tax: $tax, ')
          ..write('subtotal: $subtotal, ')
          ..write('customerId: $customerId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('invoiceId: $invoiceId')
          ..write('productCode: $productCode, ')
          ..write('createAt: $createdAt, ')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      invoicenumber,
      total,
      tax,
      subtotal,
      customerId,
      productId,
      quantity,
      price,
      invoiceId,
      productCode,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceDataClass &&
          other.id == this.id &&
          other.invoicenumber == this.invoicenumber &&
          other.total == this.total &&
          other.tax == this.tax &&
          other.subtotal == this.subtotal &&
          other.customerId == this.customerId &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.invoiceId == this.invoiceId &&
          other.productCode == this.productCode &&
          other.createdAt == this.createdAt);
}

class InvoiceTableCompanion extends UpdateCompanion<InvoiceDataClass> {
  final Value<int> id;
  final Value<String> invoicenumber;
  final Value<double> total;
  final Value<double> tax;
  final Value<double> subtotal;
  final Value<String> customerId;
  final Value<int> productId;
  final Value<double> quantity;
  final Value<double> price;
  final Value<String> invoiceId;
  final Value<String> productCode;
  final Value<DateTime> createdAt;
  const InvoiceTableCompanion(
      {this.id = const Value.absent(),
      this.invoicenumber = const Value.absent(),
      this.total = const Value.absent(),
      this.tax = const Value.absent(),
      this.subtotal = const Value.absent(),
      this.customerId = const Value.absent(),
      this.productId = const Value.absent(),
      this.quantity = const Value.absent(),
      this.price = const Value.absent(),
      this.invoiceId = const Value.absent(),
      this.productCode = const Value.absent(),
      this.createdAt = const Value.absent()});
  InvoiceTableCompanion.insert(
      {this.id = const Value.absent(),
      required String invoicenumber,
      this.total = const Value.absent(),
      this.tax = const Value.absent(),
      this.subtotal = const Value.absent(),
      required String customerId,
      required int productId,
      required double quantity,
      required double price,
      required String invoiceId,
      required String productCode,
      this.createdAt = const Value.absent()})
      : invoicenumber = Value(invoicenumber),
        customerId = Value(customerId),
        productId = Value(productId),
        quantity = Value(quantity),
        price = Value(price),
        invoiceId = Value(invoiceId),
        productCode = Value(productCode);
  static Insertable<InvoiceDataClass> custom({
    Expression<int>? id,
    Expression<String>? invoicenumber,
    Expression<double>? total,
    Expression<double>? tax,
    Expression<double>? subtotal,
    Expression<String>? customerId,
    Expression<int>? productId,
    Expression<double>? quantity,
    Expression<double>? price,
    Expression<String>? invoiceId,
    Expression<String>? productCode,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoicenumber != null) 'invoicenumber': invoicenumber,
      if (total != null) 'total': total,
      if (tax != null) 'tax': tax,
      if (subtotal != null) 'subtotal': subtotal,
      if (customerId != null) 'customer_id': customerId,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (productCode != null) 'product_code': productCode,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  InvoiceTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? invoicenumber,
      Value<double>? total,
      Value<double>? tax,
      Value<double>? subtotal,
      Value<String>? customerId,
      Value<int>? productId,
      Value<double>? quantity,
      Value<double>? price,
      Value<String>? invoiceId,
      Value<String>? productCode,
      Value<DateTime>? createdAt}) {
    return InvoiceTableCompanion(
        id: id ?? this.id,
        invoicenumber: invoicenumber ?? this.invoicenumber,
        total: total ?? this.total,
        tax: tax ?? this.tax,
        subtotal: subtotal ?? this.subtotal,
        customerId: customerId ?? this.customerId,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        invoiceId: invoiceId ?? this.invoiceId,
        productCode: productCode ?? this.productCode,
        createdAt: createdAt ?? this.createdAt);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoicenumber.present) {
      map['invoicenumber'] = Variable<String>(invoicenumber.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (tax.present) {
      map['tax'] = Variable<double>(tax.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (productCode.present) {
      map['product_code'] = Variable<String>(productCode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceTableCompanion(')
          ..write('id: $id, ')
          ..write('invoicenumber: $invoicenumber, ')
          ..write('total: $total, ')
          ..write('tax: $tax, ')
          ..write('subtotal: $subtotal, ')
          ..write('customerId: $customerId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('invoiceId: $invoiceId')
          ..write('productCode: $productCode, ')
          ..write('createdAt: $createdAt, ')
          ..write(')'))
        .toString();
  }
}

class $InvoiceTableTable extends InvoiceTable
    with TableInfo<$InvoiceTableTable, InvoiceDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $InvoiceTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _invoicenumberMeta =
      const VerificationMeta('invoicenumber');
  @override
  late final GeneratedColumn<String?> invoicenumber = GeneratedColumn<String?>(
      'invoicenumber', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double?> total = GeneratedColumn<double?>(
      'total', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  final VerificationMeta _taxMeta = const VerificationMeta('tax');
  @override
  late final GeneratedColumn<double?> tax = GeneratedColumn<double?>(
      'tax', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  final VerificationMeta _subtotalMeta = const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double?> subtotal = GeneratedColumn<double?>(
      'subtotal', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  final VerificationMeta _customerIdMeta = const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<String?> customerId = GeneratedColumn<String?>(
      'customer_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int?> productId = GeneratedColumn<int?>(
      'product_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double?> quantity = GeneratedColumn<double?>(
      'quantity', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _invoiceIdMeta = const VerificationMeta('invoiceId');
  @override
  late final GeneratedColumn<String?> invoiceId = GeneratedColumn<String?>(
      'invoice_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);

  final VerificationMeta _productCodeMeta =
      const VerificationMeta('productCode');
  @override
  late final GeneratedColumn<String?> productCode = GeneratedColumn<String?>(
      'product_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: false);

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn(
      'created_at', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        invoicenumber,
        total,
        tax,
        subtotal,
        customerId,
        productId,
        quantity,
        price,
        invoiceId,
        productCode,
        createdAt,
      ];
  @override
  String get aliasedName => _alias ?? 'invoice_table';
  @override
  String get actualTableName => 'invoice_table';
  @override
  VerificationContext validateIntegrity(Insertable<InvoiceDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoicenumber')) {
      context.handle(
          _invoicenumberMeta,
          invoicenumber.isAcceptableOrUnknown(
              data['invoicenumber']!, _invoicenumberMeta));
    } else if (isInserting) {
      context.missing(_invoicenumberMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    }
    if (data.containsKey('tax')) {
      context.handle(
          _taxMeta, tax.isAcceptableOrUnknown(data['tax']!, _taxMeta));
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(_invoiceIdMeta,
          invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta));
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('product_code')) {
      context.handle(
          _productCodeMeta,
          productCode.isAcceptableOrUnknown(
              data['product_code']!, _productCodeMeta));
    } else if (isInserting) {
      context.missing(_productCodeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return InvoiceDataClass.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $InvoiceTableTable createAlias(String alias) {
    return $InvoiceTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $StoreTableTable storeTable = $StoreTableTable(this);
  late final $LocationTableTable locationTable = $LocationTableTable(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $VatTableTable vatTable = $VatTableTable(this);
  late final $TaxTableTable taxTable = $TaxTableTable(this);
  late final $StockTableTable stockTable = $StockTableTable(this);
  late final $BillingItemTableTable billingItemTable =
      $BillingItemTableTable(this);
  late final $TransactionTableTable transactionTable =
      $TransactionTableTable(this);
  late final $InvoiceTableTable invoiceTable = $InvoiceTableTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final StoreDao storeDao = StoreDao(this as AppDatabase);
  late final LocationDao locationDao = LocationDao(this as AppDatabase);
  late final ProductDao productDao = ProductDao(this as AppDatabase);
  late final VatDao vatDao = VatDao(this as AppDatabase);
  late final TaxDao taxDao = TaxDao(this as AppDatabase);
  late final StockDao stockDao = StockDao(this as AppDatabase);
  late final BillingItemDao billingItemDao =
      BillingItemDao(this as AppDatabase);
  late final TransactionDao transactionDao =
      TransactionDao(this as AppDatabase);
  late final InvoiceDao invoiceDao = InvoiceDao(this as AppDatabase);

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userTable,
        storeTable,
        locationTable,
        productTable,
        vatTable,
        taxTable,
        stockTable,
        billingItemTable,
        transactionTable,
        invoiceTable,
      ];
}
