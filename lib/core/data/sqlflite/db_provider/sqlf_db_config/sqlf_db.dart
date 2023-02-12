import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:tekartik_app_flutter_sqflite/sqflite.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';

class sqlfDBProvider {
  final lock = Lock(reentrant: true);
  /// MySql DB Factory..
  initSqlflite()async {
    if (!kIsWeb) {
      sqfliteWindowsFfiInit();
      var packageName = 'com.example.api_sqflite_rest';
      final path = await databaseFactory.getDatabasesPath();
      dbFactory = getDatabaseFactory(packageName: packageName,rootPath:path);
    }else{
      dbFactory = databaseFactoryFfiWeb;
      /// https://pub.dev/packages/sqflite_common_ffi
      /// https://pub.dev/documentation/sqflite_common_ffi_web/latest/
    }
  }
  late final dynamic dbFactory;
  final _updateTriggerController = StreamController<bool>.broadcast();
  Database? db;
  late Future<dynamic> _dbpath;
  set dbpath(String dbname) => _dbpath = openPath(dbname);
  Future<dynamic> get dbpaths => _dbpath;

  Future openPath(String path) async => db = await dbFactory.openDatabase(path, options: OpenDatabaseOptions(version: 1, onCreate: (db, version) async => {}, onUpgrade: (db, oldVersion, newVersion) async {}));
  void _triggerUpdate() => _updateTriggerController.sink.add(true);
  Future<Database?> get ready async => db ??= await lock.synchronized(() async => (db == null)? await dbpaths :null);
}