import 'package:asset_management/router.dart';
import 'package:asset_management/services/shared/preference_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
// import '../../core/model/auth.dart';
import '../../core/model/service/auth/change_pwd_auth.dart';
import '../../locator.dart';
import '../../services/api_request/auth_request.dart';
import '../../vgts_base_view_model.dart';
//import '../views/vgts_base_view_model.dart';

class ChangePwdViewModel extends VGTSBaseViewModel {


  final GlobalKey<FormState> changePwdFormKey = GlobalKey<FormState>();

  PasswordFormFieldController passwordController=PasswordFormFieldController(ValueKey("changeEmail"),
      required: true,requiredText: "Enter your new Password"
  );

  changePwd(BuildContext context) async {

    if(changePwdFormKey.currentState?.validate() != true) {
      return;
    }
    //else{navigationService.popAllAndPushNamed("/verification");}


    setState(ViewState.Busy);
    
    ChangeAuth? auth=await request<ChangeAuth>(AuthRequest.change_pwd(passwordController.text,preferenceService.getToken()));
    if (auth != null) {
      context.go(Routes.login);
    }
    // LoginAuth? auth = await request<LoginAuth>(AuthRequest.login(mobileNumController.text));
    // if (auth != null) {
    //   locator<PushNotificationService>().configure(mobileNumController.text);
    //   navigationService.pushNamed(Routes.otp,arguments:mobileNumController.text);
    // }
    setState(ViewState.Idle);
    notifyListeners();
  }

}