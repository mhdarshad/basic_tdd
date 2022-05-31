import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../data/models/exception_modle.dart';

class ReferfriendUseCase extends UseCase<Uri,String>{
  @override
  Future<Either<Failure, Uri>> call({required String data}) async{

    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      if (kDebugMode) {
        // print(packageInfo.packageName);
      }
      final DynamicLinkParameters parameters = DynamicLinkParameters(
            uriPrefix: 'https://asspa.page.link/refer', // uri prefix used for Dynamic Links in Firebase Console
            link: Uri.parse('https://asfahbm.com/#/refer/'+data),
            androidParameters: const AndroidParameters(
              packageName: 'com.ar.cts.asspa', // package name for your app
              minimumVersion: 0,
            ),
            iosParameters: const IOSParameters(bundleId: 'com.ar.cts.asspa'), // bundle ID for your app
          );
      // final ShortDynamicLink shortLink = await (await FirebaseDynamicLinks.instance).buildShortLink(parameters);
      return Right( parameters.longDynamicLink??parameters.link);
    } catch (e) {
      print('error: $e');
      return Left( ServerFailure(ExceptiomModle(message: e.toString())));}
  }

}