import 'package:asset_management/router.dart';
import 'package:asset_management/services/shared/dialog_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
// import '../../core/model/auth.dart';
import '../../core/model/service/auth/forgot_pwd_auth.dart';
import '../../locator.dart';
import '../../services/api_request/auth_request.dart';
import '../../vgts_base_view_model.dart';
//import '../views/vgts_base_view_model.dart';

class ForgotPwdViewModel extends VGTSBaseViewModel {


  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  EmailFormFieldController emailController=EmailFormFieldController(ValueKey("forgotEmail"),
      required: true,requiredText: "Please enter your Email"
  );

  forgot_pwd() async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }
    setState(ViewState.Busy);

    ForgotAuth? auth=await request<ForgotAuth>(AuthRequest.forgot_pwd(emailController.text));
    if(auth != null){
      preferenceService.setToken(auth.token ?? '');
      navigationService.pushNamed(Routes.change_pwd);
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

