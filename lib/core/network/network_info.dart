import 'package:data_connection_checker_tv/data_connection_checker.dart'
if (dart.library.html) "data_connection_checker_web.dart" as dc;

import '../data/dependecy_abstact_db.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected; 
}
class NetworkInfoImpl implements NetworkInfo {
  final dc.DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}