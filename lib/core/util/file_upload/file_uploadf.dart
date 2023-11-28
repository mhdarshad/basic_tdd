import 'dart:io';
import 'dart:typed_data';

import 'package:azblob/azblob.dart';
import 'package:rising_gym/core/cripto_algo.dart';
import 'package:rising_gym/core/usecases/usecase.dart';
import 'package:rising_gym/tdd/presentaion/modules/dashboard/dashboard_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import '../../../injection_container.dart';
import '../../../tdd/domain/modle/vx_store.dart';
import '../config/user_config.dart';

class Filemanager {

 static Future<Either<String?, String>>  uploadFile(File file, String fileName,String apiUrl,String key) async {
    String? authtocken;
    String? custauthtocken;
    if(sl<Configration>().tocken!=null) {
      authtocken = sl<Configration>().tocken!.decript;
    }
    authtocken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImUyMTY2NWI3MmMwY2U2OWMzZmVlNjZkYmEzOTM0MjIyMjJiMzk0ZWRmN2IyN2UyNmRlZDFjNTc4ZGY4YTU2NThiNDU5YTMxMDkyN2NhZjIyIn0.eyJhdWQiOiI5NSIsImp0aSI6ImUyMTY2NWI3MmMwY2U2OWMzZmVlNjZkYmEzOTM0MjIyMjJiMzk0ZWRmN2IyN2UyNmRlZDFjNTc4ZGY4YTU2NThiNDU5YTMxMDkyN2NhZjIyIiwiaWF0IjoxNjkyODg1NDk3LCJuYmYiOjE2OTI4ODU0OTcsImV4cCI6MTcyNDUwNzg5Nywic3ViIjoiNDM2NjUiLCJzY29wZXMiOltdfQ.k6-m5P8Caiy9OHVZxIiSBjtYoZv3itg0R44zrd-GXoVlOJH1iwyInlvVp-Ls9wpYkrCk0-yAXiQ4_LL-H9hGmomztH_rWxLUmkfIJixKo_Kc7Vcbf5wjCWaIsToS-XgKD8is_7TMLkoX_CyDw3evSU80jIT0AVdVoyJpMJeW_fmItYAonsaTmutJOZtYWUqWiP66gTiq6GC7N56Iq0PWyuhRuottfhM3SDqVYaEOqlEE75BfZKYvDfHrTT2HTVeZ7fmciCr1Tx3SJ46OB5Xap2AOjU0X8rIEZ27Hu_cwCoP4XFfd-xrQs5sYE2uPd7KuiJzAf38LPTuxK4UC7VsMuvFmBCre4H43aQrH9fw-1GVoK9kWTQvsgKIAQDNYB3Kqk7eiMgWwfPmcP-y0nhxgmyi7uPg5N-CODs9NUZGyhHlIgW90TZ93f9NxPnDJ9sn4zqy-LVK38BtlnSSgtXi9R5IYlvIYyrtVJibO56Oj4HG85amRD7ciPWBSyoLl1BpO0EdfhfF5BJLfh58pVUlH-0qdIuAmxoVHMunlUOPz4-vRBY8YMGk7D52rJk1xMomdvRlz9U1tCVDYrjMft1erObm7Z2WH2r1xzU9HsCWtt9ErbpGb_Yk-crZnGdmJXffkbVi1nTnN_wCH4PZV9K62s8sNurIveHVTQ9P7Hw5iTHI";
    if(sl<Configration>().custTocken!=null) {
      custauthtocken = sl<Configration>().custTocken!.decript;
    }
    late Map<String,String> headers  = {
      'Accept': 'application/json',
      'X-Customer-Auth': sl<Configration>().custTocken!.decript,
      'Authorization': 'Bearer $authtocken',
      'Cookie': 'XSRF-TOKEN=${sl<Configration>().custTocken!.decript}'
    };
    // headers['Content-Type'] = "application/json";
    // headers['Accept'] = "application/json";


    // if(custauthtocken!=null)headers['X-Customer-Auth'] = custauthtocken;
    // if(authtocken!=null)headers['Authorization'] = 'Bearer $authtocken';
    var request = http.MultipartRequest('POST', Uri.parse('https://dev.cloudmesoft.com/api/flutter/$apiUrl'));
    request.files.add(await http.MultipartFile.fromPath(key, file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responsedata = await response.stream.bytesToString();
      print("API URL: https://dev.cloudmesoft.com/api/flutter/$apiUrl");
      print("response: ${responsedata}");
      await Clipboard.setData( ClipboardData(text: responsedata));
      sl<DashboardEvent>()(data: NoPrams());
      // print(await response.stream.bytesToString());
      return Right(responsedata);
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