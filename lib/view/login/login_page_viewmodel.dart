import 'package:flutter/cupertino.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
import '../../locator.dart';
import '../../vgts_base_view_model.dart';
//import '../views/vgts_base_view_model.dart';

class LogInViewModel extends VGTSBaseViewModel {


  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  EmailFormFieldController emailController=EmailFormFieldController(ValueKey("txtLoginEmail"),
      required: true,requiredText: "Email field is required "
  );

  PasswordFormFieldController passwordController= PasswordFormFieldController(ValueKey("txtLoginPassword"),
      required: true,requiredText: "Password field is required");


  register() async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }
    else{navigationService.pushNamed("/main");}


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