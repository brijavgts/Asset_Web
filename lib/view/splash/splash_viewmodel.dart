import 'dart:convert';
import 'dart:js';

import 'package:asset_management/core/model/service/auth/verify_mail_auth.dart';
import 'package:asset_management/view/register/register_page_viewmodel.dart';
import 'package:asset_management/view/register/verify_register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
//import '../../../helper/firebase_remote_helper.dart';
//import '../../../helper/update_checker.dart';
import '../../../locator.dart';
import '../../../router.dart';
import '../../../services/shared/api_model/no_response_exception.dart';
import '../../../services/shared/api_model/request_settings.dart';
//import '../../../services/shared/network_service.dart';
import '../../../services/shared/preference_service.dart';
import '../../core/model/service/auth/login_auth.dart';
import '../../services/api_request/auth_request.dart';
import '../../vgts_base_view_model.dart';
import 'package:http/http.dart'as http;

class SplashViewModel extends VGTSBaseViewModel {


  @override
  Future onInit() async {
    //await locator<FirebaseRemoteHelper>().configure();
    await locator<PreferenceService>().init();
    // await locator<NetworkService>().init();
    //await locator<UpdateChecker>().versionCheck(navigationService.navigatorKey.currentContext!);

    try {

      Future.delayed(const Duration(milliseconds: 500), () {
        navigationService.popAllAndPushNamed(preferenceService.getHashedEmail().isNotEmpty?Routes.verify_register:Routes.login);
      });

    } catch (ex) {
      debugPrint("EXCEPTION $ex");
    }

    return super.onInit();
  }


  @override
  void handleNoResponse(RequestSettings settings, NoResponseException exception) {
    debugPrint("ViewModel ${exception.message}");
    super.handleNoResponse(settings, exception);
  }
}

/*Future<VerifyEmailAuth> onInit() async {
  await locator<PreferenceService>().init();

  final response = await http
      .get(Uri.parse("http://localhost:59999/#/main?mail=${preferenceService
      .getHashedEmail()}"));
  try {
    if (response.statusCode == 200) {
      navigationService.popAllAndPushNamed(Routes.main);
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      navigationService.popAllAndPushNamed(Routes.login);
    });
  }
  catch (ex) {
    debugPrint("EXCEPTION $ex");
  }

  return super.onInit();
}*/

























// try {
//   Future.delayed(const Duration(milliseconds: 500), () {
//     navigationService.popAllAndPushNamed(preferenceService.getHashedEmail().isNotEmpty
//         ?"/main?mail=${preferenceService.getHashedEmail()}":Routes.login);
//   });
//
// }

// try {
//       if (preferenceService.getHashedEmail().isNotEmpty) {
//         VerifyEmailAuth? auth = await request<VerifyEmailAuth>(AuthRequest.verifyRegister("http://localhost:59999/#/main?mail=${preferenceService.getHashedEmail()}"));
//         if (auth != null) {
//           navigationService.popAllAndPushNamed(Routes.verification);
//         }
// // Do api call that should be called after authentication
//       }
//       Future.delayed(const Duration(milliseconds: 500), () {
//         navigationService.popAllAndPushNamed(Routes.login);
//       });
//
//     }

/*home: FutureBuilder(
future: AuthService.getToken(),
builder: (_, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return CircularProgressIndicator();
} else if (snapshot.hasData) {
return HomeScreen();
} else {
return LoginScreen();
}
},
),*/

/* //----------------------
         // navigationService.popAllAndPushNamed(Routes.main);
        VerifyEmailAuth? auth = await request<VerifyEmailAuth>(AuthRequest.verifyEmail(PreferenceService.hashedMail,
            ));
        if (auth != null) {
          navigationService.popAllAndPushNamed(Routes.main);
        }//-----------------------
*/

 // VerifyEmailAuth? auth = await request<VerifyEmailAuth>(AuthRequest.verifyEmail(preferenceService.getHashedEmail()));
 //
 //    if (auth != null) {
 //      preferenceService.setAccessToken(auth.accessToken ?? '');//-------
 //      navigationService.popAllAndPushNamed(Routes.verification);
 //    }
