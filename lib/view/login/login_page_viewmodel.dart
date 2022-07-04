import 'package:asset_management/services/shared/preference_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
import '../../core/model/auth.dart';
import '../../core/model/service/auth/login_auth.dart';
import '../../locator.dart';
import '../../router.dart';
import '../../services/api_request/auth_request.dart';
import '../../vgts_base_view_model.dart';
//import '../views/vgts_base_view_model.dart';

class LogInViewModel extends VGTSBaseViewModel {


  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  EmailFormFieldController emailController=EmailFormFieldController(ValueKey("logEmail"),
      required: true,requiredText: "Email field is required "
  );

  PasswordFormFieldController passwordController= PasswordFormFieldController(ValueKey("logPwd"),
      required: true,requiredText: "Password field is required");


  login() async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }
     setState(ViewState.Busy);
    LoginAuth? auth = await request<LoginAuth>(AuthRequest.login(emailController.text,passwordController.text));
    if (auth != null) {
      Fluttertoast.showToast(msg: "Your Journey with us");
      // locator<PushNotificationService>().configure(mobileNumController.text);
      navigationService.popAllAndPushNamed(Routes.main);
    }
    setState(ViewState.Idle);
    notifyListeners();
  }



}