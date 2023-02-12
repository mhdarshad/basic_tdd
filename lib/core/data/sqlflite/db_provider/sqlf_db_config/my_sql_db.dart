import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';

class MySqlDBProvider {
  final lock = Lock(reentrant: true);
  /// MySql DB Factory..
  late MySqlConnection conn;
  initMySql()async{
    try {
      conn = await MySqlConnection.connect(ConnectionSettings(
                  host: 'host',
                  port: 3306,
                  user: 'user',
                  password: 'pswd',
                  db: 'db'));
    } on SocketException catch (e) {
      if (kDebugMode) {
        print("Not Connected to MySql DB");
        print("$e");

      }else{
        print("Not Connected to MySql DB");

      }
      // throw const SocketException("Not Connected to DB");
    }
  }
}