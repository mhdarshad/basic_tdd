
import 'dart:convert';

import 'modle_entities.dart';

class RepositoryModel extends ModelEntities{
  RepositoryModel(Map<String, dynamic> data) : super(jsonEncode(data));
  RepositoryModel.fromJson(json):super(jsonEncode(json));
}
class CacheRepositoryModel extends ModelEntities{
  CacheRepositoryModel(Map<String, dynamic> data) : super(jsonEncode(data));
  CacheRepositoryModel.fromJson(json):super(json);

}