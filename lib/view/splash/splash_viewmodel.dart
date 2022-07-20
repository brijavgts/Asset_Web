import 'dart:convert';

import 'package:asset_management/core/model/service/auth/verify_mail_auth.dart';
import 'package:asset_management/services/shared/api_model/error_response_exception.dart';
import 'package:asset_management/services/shared/api_model/string_extension.dart';
import 'package:asset_management/view/register/register_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
//import '../../../helper/firebase_remote_helper.dart';
//import '../../../helper/update_checker.dart';
import '../../../locator.dart';
import '../../../router.dart';
import '../../../services/shared/api_model/no_response_exception.dart';
import '../../../services/shared/api_model/request_settings.dart';
//import '../../../services/shared/network_service.dart';
import '../../../services/shared/preference_service.dart';
import '../../core/enum/view_state.dart';
import '../../core/model/service/auth/login_auth.dart';
import '../../services/api_request/auth_request.dart';
import '../../vgts_base_view_model.dart';
import 'package:http/http.dart'as http;

class SplashViewModel extends VGTSBaseViewModel {

  VerifyEmailAuth? _auth;
  VerifyEmailAuth? get auth => _auth;

   init(hashedEmail,BuildContext context) async {
     try {
        var data = GoRouter.of(context).location;
        _auth = await request<VerifyEmailAuth>(AuthRequest.verifyEmail(hashedEmail));
        if (_auth != null) {
          await preferenceService.setAccessToken(_auth!.accessToken ?? "");
          await Fluttertoast.showToast(msg: "Successfully Verified.....");
          context.go(Routes.dashboard);
        }
        notifyListeners();
    }
    catch (ex) {
      debugPrint("EXCEPTION $ex");
    }

    return super.onInit();
  }


  @override
  void handleNoResponse(RequestSettings settings, NoResponseException exception) {
    debugPrint("ViewModel ${exception.message}");
    super.handleNoResponse(settings, exception);
  }

  @override
  void handleErrorResponse(RequestSettings settings, ErrorResponseException exception) {
     print("asdasd");
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
