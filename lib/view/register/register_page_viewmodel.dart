import 'dart:convert';
import 'dart:html';

import 'package:asset_management/core/model/auth.dart';
import 'package:asset_management/services/api_request/auth_request.dart';
import 'package:asset_management/view/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
import '../../locator.dart';
import '../../router.dart';
import '../../vgts_base_view_model.dart';
//import '../views/vgts_base_view_model.dart';




class RegisterViewModel extends VGTSBaseViewModel {



  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  ScrollController regScrollController = ScrollController();

  NameFormFieldController nameController= NameFormFieldController(ValueKey("regName"),
      required: true,requiredText: "Please enter your Name");

  NameFormFieldController orgController=NameFormFieldController(ValueKey("regtOrg"),
      required: true,requiredText: "Please enter Organization Name"
  );

  EmailFormFieldController emailController=EmailFormFieldController(ValueKey("regEmail"),
      required: true,requiredText: "Please enter an Email"
  );

  PasswordFormFieldController passwordController= PasswordFormFieldController(ValueKey("regPassword"),
      required: true,requiredText: "Password field is required");


  register() async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }
    //else{navigationService.pushNamed("/verification");}
    setState(ViewState.Busy);

    List<RegisterAuth>? auth = await requestList<RegisterAuth>(AuthRequest.register(nameController.text,
        emailController.text, passwordController.text,orgController.text));
    if (auth != null) {
      Fluttertoast.showToast(msg: "Verifying Email.....");//--------
      // locator<PushNotificationService>().configure(mobileNumController.text);
      navigationService.popAllAndPushNamed(Routes.verification);
    }

    setState(ViewState.Idle);
    notifyListeners();
  }

}

/*await request<Auth>(AuthRequest.register(nameController.text,
        emailController.text, passwordController.text, orgController.text));

     var auth = await AuthRequest.register(nameController.text,
         emailController.text, passwordController.text, orgController.text);
     if (auth != null) {
       locator<PushNotificationService>().configure(nameController.text,
       emailController.text, passwordController.text, orgController.text);
       navigationService.pushNamed(Routes.verification,arguments: emailController.text, );
     }*/