import 'package:flutter/cupertino.dart';
//import '../../../helper/firebase_remote_helper.dart';
//import '../../../helper/update_checker.dart';
import '../../../locator.dart';
import '../../../router.dart';
import '../../../services/shared/api_model/no_response_exception.dart';
import '../../../services/shared/api_model/request_settings.dart';
//import '../../../services/shared/network_service.dart';
import '../../../services/shared/preference_service.dart';
import '../../vgts_base_view_model.dart';
//import '../vgts_base_view_model.dart';

class SplashViewModel extends VGTSBaseViewModel {

  @override
  Future onInit() async {

    //await locator<FirebaseRemoteHelper>().configure();
    //await locator<PreferenceService>().init();
    //await locator<NetworkService>().init();
    //await locator<UpdateChecker>().versionCheck(navigationService.navigatorKey.currentContext!);

    try {
      if (preferenceService.getBearerToken().isNotEmpty) {
        // Do api call that should be called after authentication
      }
      Future.delayed(const Duration(milliseconds: 500), () {
        navigationService.popAllAndPushNamed(Routes.register);
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