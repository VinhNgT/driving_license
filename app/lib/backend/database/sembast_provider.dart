import 'package:driving_license/logging/logger_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/sembast_memory.dart';

part 'sembast_provider.g.dart';

class SembastController {
  SembastController(this.database);
  final Database database;

  @factory
  static Future<SembastController> makeDefault() async {
    return SembastController(await _createDatabase('sembast.db'));
  }

  static Future<Database> _createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase(join(appDocDir.path, filename));
  }
}

@Riverpod(keepAlive: true)
Future<Database> sembast(Ref ref) async {
  final dbController = await SembastController.makeDefault();

  ref.onDispose(dbController.database.close);
  return dbController.database;
}

@Riverpod(keepAlive: true)
class InMemorySembast extends _$InMemorySembast {
  int _listenerCount = 0;

  @override
  Future<Database> build(String dbName) async {
    final dbFactory = newDatabaseFactoryMemory();
    final db = await dbFactory.openDatabase(dbName);
    final logger = ref.watch(loggerProvider);

    debugPrint('Create in-memory database: $dbName');
    ref.onDispose(() {
      debugPrint('Dispose in-memory database: $dbName');
      db.close();
    });

    ref.onAddListener(() {
      _listenerCount++;
      if (_listenerCount > 1) {
        logger.w(
          'There are more than one listener for in-memory database: $dbName\n\n'
          'This is most likely because you\'re trying to create multiple '
          'databases with the same name. This is not allowed and all of them '
          'will point to the same in-memory database. If this is want you '
          'want, create a new provider that listens to the in-memory database '
          '"$dbName" and move all of the listeners to that provider.',
        );
      }
    });
    ref.onRemoveListener(() {
      _listenerCount--;
    });

    return db;
  }
}
