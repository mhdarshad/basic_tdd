import 'dart:io';
import 'dart:typed_data';

import 'package:azblob/azblob.dart';
import 'package:cloud_me_v2/core/cripto_algo.dart';
import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/dashboard/dashboard_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import '../../../injection_container.dart';
import '../../../tdd/domain/entities/vx_store.dart';
import '../config/user_config.dart';

class Filemanager {

 static Future<Either<String?, String>>  uploadFile(File file, String fileName,String apiUrl,String key) async {
    String? authtocken;
    String? custauthtocken;
    late Map<String,String> headers  = {
      'Accept': 'application/json',
      'X-Customer-Auth': sl<Configration>().custTocken!.decript,
      'Authorization': 'Bearer ${sl<Configration>().tocken!.decript}',
      'Cookie': 'XSRF-TOKEN=${sl<Configration>().custTocken!.decript}'
    };
    // headers['Content-Type'] = "application/json";
    // headers['Accept'] = "application/json";
    if(sl<Configration>().tocken!=null) {
      authtocken = sl<Configration>().tocken!.decript;
    }
    if(sl<Configration>().custTocken!=null) {
      custauthtocken = sl<Configration>().custTocken!.decript;
    }

    // if(custauthtocken!=null)headers['X-Customer-Auth'] = custauthtocken;
    // if(authtocken!=null)headers['Authorization'] = 'Bearer $authtocken';
    var request = http.MultipartRequest('POST', Uri.parse('https://dev.cloudmesoft.com/api/flutter/$apiUrl'));
    request.files.add(await http.MultipartFile.fromPath(key, file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      sl<DashboardEvent>()(data: NoPrams());
      // print(await response.stream.bytesToString());
      return Right(await response.stream.bytesToString());
    }else {
      print(response.reasonPhrase);
      return const Left("Cannot Update ");
    }

  }
  // static Future<String> uploadFileS(List<int> file, String fileName) async {
  //   final response = await http.post(Uri.parse(''),
  //       headers: headers,
  //       body: jsonEncode(param.data!.map((key, value) => MapEntry(key, value)))
  //   );
  //   return response.data['FileId'];
  // }
  static Future uploadImageToAzure(BuildContext context,File _imageFile,String fileName) async {
    try{
      String fileName = basename(_imageFile.path);
      // read file as Uint8List
      // Uint8List content =  await  _imageFile.readAsBytes();
      var storage = AzureStorage.parse('DefaultEndpointsProtocol=https;AccountName=cloudmedubai2020diag;AccountKey=/9JOB0FCBcuTwRpl5jFwcwckST+M9NjgV7O8o+qIn2XbmciQAfoJzdL6dffsSLajcHMMwkF0wXr1UXZQeqJhKg==');
      String container="Club Management";
      // get the mine type of the file
      String contentType= lookupMimeType(fileName);
      Uint8List imagebytes = await _imageFile.readAsBytes(); //convert to bytes
      await storage.putBlob('/$container/$fileName',bodyBytes: imagebytes,contentType: contentType,type: BlobType.BlockBlob);
      print("done");
    } on AzureStorageException catch(ex){
      print(ex.message);
    }catch(err){
      print(err);
    }
}

}

String lookupMimeType(String fileName) {
  return ".${fileName.split('.').last}";}