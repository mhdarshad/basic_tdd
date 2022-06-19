import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../core/cripto_algo.dart';
import '../../../core/util/presentation/constants/ic_constants.dart';
import '../../../injection_container.dart';
import '../../domain/repositories/repository_provider.dart';
import '../models/exception_modle.dart';
import '../models/repository_modle.dart';

abstract class RemoteDataSource{
  Future<RepositoryModel> getRequest(Params param);
}
class RemoteDataSourceImpl implements RemoteDataSource{

  final http.Client client;

  final baseurl =APIConstants.API_URI;
  late http.Response responsejs;
  String? authtocken;

  RemoteDataSourceImpl({ required this.client});

  @override
  Future<RepositoryModel> getRequest(Params param) => _getTriviaFromUrl(param);

//   Future<RepositoryModel> _getTriviaFromUrl(Params param) async {
//     if(sl<SharedPreferences>().getString(SFkeys.token)!=null||sl<SharedPreferences>().containsKey(SFkeys.token)) {
//       authtocken = Cripto().decript(sl<SharedPreferences>().getString(SFkeys.token)!);
//     }
//     String meadiater = '';
//     try {
//       if(param.methed==Methed.Get){
//        meadiater = "?";
//         param.data!.forEach((key, value) {
//           if(!meadiater.substring(meadiater.length - 1).contains("?")) {
//             meadiater = meadiater+"&";
//           }
//           meadiater = meadiater+key+"="+value;
//         });
//         print("$baseurl${param.uri}$meadiater");
//         // final String url = "https://manage.grocbay.com/api/app-manager/get-functionality/${param.uri}";
//       }
//       // final response = param.methed==Methed.Get?await client.get(
//       //   Uri.parse("https://manage.grocbay.com/api/app-manager/get-functionality/${param.uri}/$meadiater"),
//       //   headers: {'Content-Type': 'application/x-www-form-urlencoded'},
//       // ):  param.methed==Methed.PostJson? await client.post(Uri.parse("https://manage.grocbay.com/api/app-manager/get-functionality/${param.uri}"),body: json.encode(param.data),   headers: {'Content-Type': 'application/json'},):await client.post(Uri.parse("https://manage.grocbay.com/api/app-manager/get-functionality/${param.uri}"),body: param.data,   headers: {'Content-Type': 'application/x-www-form-urlencoded'},);
//       // print("url data:${param.data.toString()}");
//       // print("response: ${response.body}");
//       late Map<String,String> headers ={};
//        headers['Content-Type'] = /*param.methed==Methed.PostJson?*/'application/json'/*:'application/x-www-form-urlencoded'*/;
//        if(authtocken!=null)headers['Authorization'] = 'Bearer $authtocken';
//       final String url = '$baseurl${param.uri}$meadiater';
//       print("url: $url");
//       var request = http.Request(param.methed, Uri.parse(url));
//       /*param.methed==Methed.PostJson?*/ request.body = json.encode(param.data)/*:request.bodyFields = param.data!.map((key, value) => MapEntry(key, value.toString()))*/;
//       request.headers.addAll(headers);
// //Response..
//       http.StreamedResponse responses = await request.send();
//       print("status code ${responses.statusCode }");
//       if (responses.statusCode == 200) {
//         final response = await responses.stream.bytesToString();
//         print("$baseurl${param.uri}");
//         print(json.decode(response).toString());
//         return RepositoryModel(json.decode(response));
//       } else if(responses.statusCode == 500){
//         if (kDebugMode) {
//           print(await responses.stream.bytesToString());
//         }
//         throw ServerExceptions(responses.statusCode,ExceptiomModle(message: "Please Contact Us"));
//       } else if(responses.statusCode == 401){
//         final response = await responses.stream.bytesToString();
//         throw ClintExceptions(responses.statusCode,ExceptiomModle(message: json.decode(response)['messege'],errors: json.decode(response)['errors']));
//       } else {
//         // print(await responses.stream.bytesToString());
//         final response = await responses.stream.bytesToString();
//         print(response);
//         throw ServerExceptions(responses.statusCode,ExceptiomModle(message: json.decode(response)['messege'],errors: json.decode(response)['errors']));
//       }
//     } on Exception catch (e) {
//       debugPrint("Error while fetching server data: $e");
//       throw ServerExceptions(500,ExceptiomModle(message: e.toString()));
//       // TODO
//     }
//   }
  Future<RepositoryModel> _getTriviaFromUrl(Params param) async {
    debugPrint("stateing");
    String meadiater = '';
    if(sl<SharedPreferences>().getString(SFkeys.token)!=null||sl<SharedPreferences>().containsKey(SFkeys.token)) {
      authtocken = Cripto().decript(sl<SharedPreferences>().getString(SFkeys.token)!);
    }

    try {
      if(param.methed==Methed.Get){
        meadiater = "?";
        param.data?.forEach((key, value) {
          if(!meadiater.substring(meadiater.length - 1).contains("?")) {
            meadiater = meadiater+"&";
          }
          meadiater = meadiater+key+"="+value;
        });
        debugPrint("$baseurl${param.uri}$meadiater");
        // final String url = "https://manage.grocbay.com/api/app-manager/get-functionality/${param.uri}";
      }else {
        if (kDebugMode) {
          debugPrint("$baseurl${param.uri}${param.data!.map((key, value) => MapEntry(key, value.toString())).toString()}");
        }
      }
      debugPrint("Json Value");
      late Map<String,String> headers = {};
      headers['Content-Type'] = "application/x-www-form-urlencoded";
      headers['Accept'] = "application/json";
      if(authtocken!=null)headers['Authorization'] = 'Bearer $authtocken';

      if(param.methed == Methed.Post){
        responsejs = await http.post(Uri.parse('$baseurl${param.uri}$meadiater'),
            headers: headers,
            body: param.data!.map((key, value) => MapEntry(key, value.toString()))
        );
      }
      else  if(param.methed == Methed.Get){
        responsejs = await http.get(Uri.parse('$baseurl${param.uri}$meadiater'),headers: headers);
      }
      else  if(param.methed == Methed.Put){
        responsejs = await http.put(Uri.parse('$baseurl${param.uri}$meadiater'),headers: headers,
            body: param.data!.map((key, value) => MapEntry(key, value.toString())));
      }
      else  if(param.methed == Methed.Delete){
        responsejs = await http.delete(Uri.parse('$baseurl${param.uri}$meadiater'),headers: headers,
          /* body: param.data!.map((key, value) => MapEntry(key, value.toString()))*/
        );
      }
      /*  var request = http.Request(param.methed==Methed.Get?'GET':'POST', Uri.parse('$baseurl${param.uri}$meadiater'));
      param.methed==Methed.PostJson? request.body = json.encode(param.data):request.bodyFields = param.data!.map((key, value) => MapEntry(key, value.toString()));
      request.headers.addAll(headers);
      http.StreamedResponse responses = await request.send();
      debugPrint("status code ${responses.statusCode }");
      debugPrint("$baseurl${param.uri} parms${param.data.toString()}");*/
      if (responsejs.statusCode == 200) {
        debugPrint("status: ${responsejs.statusCode} data: ${responsejs.body}");
        final response = responsejs.body;
        debugPrint(json.decode(response).toString());
        if(json.decode(response)[0]!=null){
          ///if Response is writern [{}]
          debugPrint("resp type: []");
          return RepositoryModel(json.decode(response)[0]);
        }else if(json.decode(response)["data"]!=null) {
          ///if Response is written {'data':[]}
          debugPrint("resp type: {'data':[]}");
          if (json.decode(response)["status"].toString() == "200") {
            return RepositoryModel(json.decode(response));
          }else if(json.decode(response)["status"].toString() == "400"){
            throw ServerExceptions(responsejs.statusCode,ExceptiomModle(message: "Invalid Login"));
          } else if (json.decode(response)["status"] == true) {
            return RepositoryModel(json.decode(response));
          } else {
            print(response);
            throw ServerExceptions(responsejs.statusCode,ExceptiomModle(message: "Please Contact Us"));
          }
        }else{
          ///if Response is written {[]}
          return RepositoryModel(json.decode(response));
        }
      } else {
        print("status: ${responsejs.statusCode} error: ${responsejs.body}");
        // print(await responses.stream.bytesToString());
        throw ServerExceptions(responsejs.statusCode,ExceptiomModle(message: json.decode(responsejs.body)['messege'],errors: json.decode(responsejs.body)['errors']));
      }
    } on Exception catch (e) {
      debugPrint("Error while fetching server data: $e");
      throw ServerExceptions(500,ExceptiomModle(message: e.toString()));
      // TODO
    }
  }

}