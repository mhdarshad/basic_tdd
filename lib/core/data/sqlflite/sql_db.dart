import '../db_abstract.dart';
import 'db_provider/db_congfig.dart';

class SQLDBFunctions extends DBBaseFunctions{
  /// Should initilize in Data layer Repo before calling
  late String tablename;
   SQLDBFunctions(String dbname) : super(dbname) ;

  @override
  create(Map<String, dynamic> data) => throw UnimplementedError();

  @override
  fetchAll() => dbProvider.queryLanguage('select * from $tablename');

  @override
  Future<List<Map<String, dynamic>>> fetchMultipleWhere(Map<String, List<dynamic>> conditions, [List<String>? forColumn]) {
    List<String> contionString = [];
    conditions.forEach((key, value) => contionString.add('$key in ("${value.join('","')}")'));
    return dbProvider.queryLanguage('select ${forColumn?.join(',')??'*'} from $tablename where ${contionString.join(' AND ')}');
  }

  @override
  Future<List<Map<String, dynamic>>> fetchQuery(String query) => dbProvider.queryLanguage(query);

  @override
  Future<List<Map<String, dynamic>>> fetchWhere(Map<String, dynamic> conditions, [List<String>? forColumn]) => throw UnimplementedError();

  @override
  insert(List<Map<String, dynamic>> data) async=> await dbProvider.BulkInsert(_insertQuery(data.first),data.map((e) => e.values.toList()));

  @override
  updateAll(data) => throw UnimplementedError();

  @override
  updateWhere(data, String where) => throw UnimplementedError();

  /// Convert json values to Update Query
  String _UpdateConditionalQuery(Map<String,dynamic> updateData,[Map<String,dynamic>? where])=> 'update $tablename set  ${jsonListToConditionString(updateData)}${where!=null? 'where  ${jsonListToConditionString(where)}':''}';
  /// Convert json values to Delete Query
  String _deleatteConditionalQuery(Map<String, String> conditions)=> 'delete from $tablename where  ${jsonListToConditionString(conditions)}';
  /// Convert Json Value to Insert Query
  String  _insertQuery(Map<String,dynamic> data)=>'insert into $tablename (${jsonListToComaSupratedString(data,MAPKeyList.key)}) values (${jsonListToComaSupratedString(data.map((key, value) => MapEntry(key, '?')),MAPKeyList.value)})';
  /// Convert Json Value to Insert Query
  String  _fetchConditionQuery(Map<String,dynamic> data,List<String>? forColumn)=>'select ${forColumn?.join(',')??'*'} from $tablename where ${jsonListToConditionString(data)}';
  /// Convert Json Value to Create table Query
  String  _createQuery(Map<String,dynamic> data) => 'CREATE TABLE IF NOT EXISTS $tablename(${jsonListToConditionString(data,'')})';
  /// - Convert Json List Value to SQL Condition eg: { key1 :value1,key2:value2} to key1 = value1 and key2 = value2
  /// - If you add Intermediate it will join with that Operator
  String jsonListToConditionString(Map<String,dynamic> conditions,[String intermediate = '=']){
    List<String> contionString = [];
    conditions.forEach((key, value) {
      if (value != null) {
        contionString.add('$key $intermediate "$value"');
      } else {
        contionString.add('$key is $value');
      }
    });

    return contionString.join(' and ').toString();
  }
  /// Convert Json List Value to Coma Suppurated String eg: { key1 :value1,key2:value2} to key1, key2
  String jsonListToComaSupratedString(Map<String,dynamic> conditions,[MAPKeyList value=MAPKeyList.key]){
    List<String> contionString = [];
    switch(value){

      case MAPKeyList.key:
        conditions.forEach((key, value) => contionString.add('$key'));
        break;
      case MAPKeyList.value:
        conditions.forEach((key, value) => contionString.add('$value'));
        break;
    }

    return contionString.join(",");
  }
}
enum MAPKeyList{
  key,value
}
