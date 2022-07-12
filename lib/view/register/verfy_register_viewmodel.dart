import 'package:asset_management/vgts_base_view_model.dart';

import '../../core/enum/view_state.dart';
import '../../core/model/service/auth/verify_mail_auth.dart';
import '../../locator.dart';
import '../../router.dart';
import '../../services/api_request/auth_request.dart';

class VerifyRegisterViewModel extends VGTSBaseViewModel {


  VerifyEmailAuth? _auth;
  VerifyEmailAuth? get auth => _auth;


   init(String hashEmail) async {

   setState(ViewState.Busy);

    print("AccesToken ${preferenceService.getAccessToken()}");
      _auth = await request<VerifyEmailAuth>(AuthRequest.verifyEmail(hashEmail));
      if (_auth != null) {
        await preferenceService.setAccessToken(_auth!.accessToken ?? "");
        navigationService.pushNamed(Routes.main);
        setState(ViewState.Idle);
        return;
    }
    notifyListeners();
   return;
  }

  @override
  void handleException() {
    // TODO: implement handleException
    super.handleException();
  }

}