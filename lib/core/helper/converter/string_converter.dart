class StringConverter{
  String jsonListToConditionString(Map<String,dynamic> conditions,[String intermediate = '=']){
    List<String> contionString = [];
    conditions.forEach((key, value) {
      if (value != null)
        contionString.add('$key $intermediate "$value"');
      else {
        contionString.add('$key is $value');
      }
    });

    return contionString.join(' and ').toString();
  }
  /// Convert Json List Value to Coma Suprated String eg: { key1 :value1,key2:value2} to key1, key2
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
  /// user for convert id to Mongo Id
  Map<String,dynamic> mongoIdJsonMerger(Map<String,dynamic> data)=> data.map((key, value) => MapEntry(key, value is Map<String,dynamic>?value['\$oid']:value));
}
enum MAPKeyList{
  key,value
}
final stringConvert = StringConverter();