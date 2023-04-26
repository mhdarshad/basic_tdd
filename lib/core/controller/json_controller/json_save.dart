import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';

class JsonSave {
  static Future<String> get localPath async {
    late String tempPath;
    if(!kIsWeb) {
      Directory tempDir = await getTemporaryDirectory();
      // Directory tempDir = await getApplicationDocumentsDirectory();

      tempPath = tempDir.path;
    }else{
      tempPath = '';
    }
    // String tempPath = tempDir.path;

    final dir = Directory('$tempPath/cloudMe');
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if ((await dir.exists())) {
      return dir.path;
    } else {
      dir.create();
      return dir.path;
    }
  }

  /// Can use Cripto for encription
  static Future writeJsonData(JsonDatakey name, Map<String,dynamic> data) async {

    var file;
    if(true){
      return  sl<SharedPreferences>().setString(name.name,jsonEncode(data));
    }
    if (Platform.isAndroid) {
      final path = await localPath;
      file = File('$path/$name.json');
    } else if (Platform.isWindows) {
      file = File('./$name.json');
    }else if (Platform.isIOS) {
      final path = await localPath;
      file = File('$path/$name.json');
    }
    return file.writeAsString(data);
  }

  static Future<Map<String,dynamic>?> getJsonData(JsonDatakey name) async {
    try {
     if(true){
    return  (sl<SharedPreferences>().getString(name.name)!=null)?jsonDecode(sl<SharedPreferences>().getString(name.name)!):null;
    }
      var file;
      if (Platform.isAndroid) {
        final path = await localPath;
        file = File('$path/$name.json');
      } else if (Platform.isWindows) {
        file = File('./$name.json');
      }else if (Platform.isIOS) {
        final path = await localPath;
        file = File('$path/$name.json');
      }

      // final file = File('./$name.json');
      // final file = File('$path/$name.json');

      final data = await file.readAsString();
       print("reaing file:$data");
      // var data=[{"items": json}];
      // List<DBModel> list =
      // data.isNotEmpty ? data.map((c) => DBModel.fromJson(c)).toList() : [];

      return data;
    } catch (e) {
      print("No such file or directory For Json");
      return null;
    }
  }

  static deleteFile(String name) async {
    try {
      if(true){
        return  sl<SharedPreferences>().remove(name);
      }
      final path = await localPath;
      var file;
      if (Platform.isAndroid) {
        file = File('$path/$name.json');
      } else if (Platform.isWindows) {
        file = File('./$name.json');
      }else if (Platform.isIOS) {
        file = File('$path/$name.json');
      }

      //final file = File('$path/$name.json'); // android build
      // final file = File('./$name.json'); // windows build

      await file.delete();
    } catch (e) {
      return 0;
    }
  }
}
enum JsonDatakey{
  db_config,
}