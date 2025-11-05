import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'sqlite_provider.g.dart';

class SqliteController {
  SqliteController(this.database);
  final Database database;

  /// This value must match the PRAGMA user_version of the database in the
  /// assets otherwise an Exception will be thrown
  static const dataBaseUserVersionConst = 5;

  @factory
  static Future<SqliteController> makeDefault(String dbName) async {
    return SqliteController(await _initDatabase(dbName));
  }

  static Future<Database> _initDatabase(String dbName) async {
    final databasesDir = await getDatabasesPath();
    final dbPath = join(databasesDir, dbName);

    // Check if the database exists
    final exists = await databaseExists(dbPath);

    // If the database doesn't exist, create a new copy from the asset
    if (!exists) {
      debugPrint(
        'Database does not exist, creating new database copy from asset',
      );
      await _createNewDbFromAsset(dbPath);
      return openDatabase(dbPath, readOnly: true);
    }

    // Check if the database is outdated
    final userVersion = await _getDbUserVersion(dbPath);
    if (userVersion != dataBaseUserVersionConst) {
      debugPrint(
        'Existing database is outdated, creating new database copy '
        'from asset',
      );
      await _createNewDbFromAsset(dbPath);
      return openDatabase(dbPath, readOnly: true);
    }

    // Open the database
    debugPrint('Opening existing database');
    return openDatabase(dbPath, readOnly: true);
  }

  static Future<int> _getDbUserVersion(String dbPath) async {
    final db = await openDatabase(dbPath, readOnly: true);
    final version = await db.getVersion();
    await db.close();
    return version;
  }

  static Future<void> _createNewDbFromAsset(String dbPath) async {
    // Make sure the parent directory exists
    try {
      await Directory(dirname(dbPath)).create(recursive: true);
    } catch (_) {
      debugPrint('Failed to create database directory');
    }

    // Delete the old database if it exists
    if (await File(dbPath).exists()) {
      await File(dbPath).delete();
    }

    // Copy from asset
    final ByteData data = await rootBundle.load(
      join('assets', basename(dbPath)),
    );
    final List<int> bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );

    // Write and flush the bytes written
    await File(dbPath).writeAsBytes(bytes, flush: true);

    // Check the user_version of the database
    final dbVersion = await _getDbUserVersion(dbPath);
    if (dataBaseUserVersionConst == -1) {
      // If _dataBaseUserVersionConst is -1, then a new copy of the database
      // will be created from the asset every time the app is started
      // (for development purposes)
      return;
    }

    if (dbVersion != dataBaseUserVersionConst) {
      throw Exception(
        'The database\'s user_version from asset does not match '
        'the expected value \'$dataBaseUserVersionConst\'',
      );
    }
  }
}

@Riverpod(keepAlive: true)
Future<Database> sqlite(Ref ref) async {
  final dbController = await SqliteController.makeDefault('questions.db');
  ref.onDispose(dbController.database.close);

  return dbController.database;
}
