import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
import '../../locator.dart';
import '../../vgts_base_view_model.dart';
//import '../views/vgts_base_view_model.dart';

class ForgotPwdViewModel extends VGTSBaseViewModel {


  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  EmailFormFieldController emailController=EmailFormFieldController(ValueKey("txtLoginEmail"),
      required: true,requiredText: "Please enter your Email"
  );

  register() async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }

    //else{navigationService.popAllAndPushNamed("/change_pwd");}


    setState(ViewState.Busy);
    // LoginAuth? auth = await request<LoginAuth>(AuthRequest.login(mobileNumController.text));
    // if (auth != null) {
    //   locator<PushNotificationService>().configure(mobileNumController.text);
    //   navigationService.pushNamed(Routes.otp,arguments:mobileNumController.text);
    // }
    setState(ViewState.Idle);
    notifyListeners();
  }



}