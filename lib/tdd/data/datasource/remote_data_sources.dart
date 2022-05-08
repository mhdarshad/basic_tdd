import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../core/util/presentation/constants/ic_constants.dart';
import '../../domain/repositories/repository_provider.dart';
import '../models/repository_modle.dart';

abstract class RemoteDataSource{
  Future<RepositoryModel> getRequest(Params param);
}
class RemoteDataSourceImpl implements RemoteDataSource{

  final http.Client client;

  final baseurl =APIConstants.API_URI;
  RemoteDataSourceImpl({ required this.client});

  @override
  Future<RepositoryModel> getRequest(Params param) => _getTriviaFromUrl(param);

  Future<RepositoryModel> _getTriviaFromUrl(Params param) async {
    String meadiater = '';
    try {
      if(param.methed==Methed.Get){
       meadiater = "?";
        param.data!.forEach((key, value) {
          if(!meadiater.substring(meadiater.length - 1).contains("?")) {
            meadiater = meadiater+"&";
          }
          meadiater = meadiater+key+"="+value;
        });
        print("$baseurl${param.uri}$meadiater");
        // final String url = "https://manage.grocbay.com/api/app-manager/get-functionality/${param.uri}";
      }
      // final response = param.methed==Methed.Get?await client.get(
      //   Uri.parse("https://manage.grocbay.com/api/app-manager/get-functionality/${param.uri}/$meadiater"),
      //   headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      // ):  param.methed==Methed.PostJson? await client.post(Uri.parse("https://manage.grocbay.com/api/app-manager/get-functionality/${param.uri}"),body: json.encode(param.data),   headers: {'Content-Type': 'application/json'},):await client.post(Uri.parse("https://manage.grocbay.com/api/app-manager/get-functionality/${param.uri}"),body: param.data,   headers: {'Content-Type': 'application/x-www-form-urlencoded'},);
      // print("url data:${param.data.toString()}");

      // print("response: ${response.body}");
      var headers = param.methed==Methed.PostJson? {
        'Content-Type': 'application/json'
      }:{
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      final String url = '$baseurl${param.uri}$meadiater';
      print("url: $url");
      var request = http.Request(param.methed==Methed.Get?'GET':'POST', Uri.parse(url));
      param.methed==Methed.PostJson? request.body = json.encode(param.data):request.bodyFields = param.data!.map((key, value) => MapEntry(key, value.toString()));
      request.headers.addAll(headers);

      http.StreamedResponse responses = await request.send();
      print("status code ${responses.statusCode }");
      if (responses.statusCode == 200) {
        final response = await responses.stream.bytesToString();
        print("$baseurl${param.uri}");
        print(json.decode(response).toString());
        if(json.decode(response)[0]!=null){
          ///if Response is writern [{}]
          return RepositoryModel(json.decode(response)[0]);
        }else if(json.decode(response)["data"]!=null) {
          ///if Response is written {'data':[]}
          if (json.decode(response)["status"].toString() == "200") {
            return RepositoryModel(json.decode(response));
          }else if(json.decode(response)["status"].toString() == "400"){
            return RepositoryModel(json.decode(response));
          } else if (json.decode(response)["status"] == true) {
            return RepositoryModel(json.decode(response));
          } else {
            print(response);
            throw ServerExceptions((json.decode(response)["status"] is bool)?500:int.parse(json.decode(response)["status"].toString()),response);
          }
        }else{
          ///if Response is written {[]}
          return RepositoryModel(json.decode(response));
        }
      } else {
        print(await responses.stream.bytesToString());
        throw ServerExceptions(responses.statusCode,await responses.stream.bytesToString());
      }
    } on Exception catch (e) {
      debugPrint("Error while fetching server data: $e");
      throw ServerExceptions(500,e.toString());
      // TODO
    }
  }

}