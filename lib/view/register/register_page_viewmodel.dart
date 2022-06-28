import 'dart:convert';
import 'dart:html';

import 'package:asset_management/core/model/auth.dart';
import 'package:asset_management/services/api_request/auth_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  NameFormFieldController nameController= NameFormFieldController(ValueKey("txtName"),
      required: true,requiredText: "Please enter your Name");

  NameFormFieldController orgController=NameFormFieldController(ValueKey("txtOrg"),
      required: true,requiredText: "Please enter Organisation Name"
  );

  EmailFormFieldController emailController=EmailFormFieldController(ValueKey("txtEmail"),
      required: true,requiredText: "Please enter an Email"
  );

  PasswordFormFieldController passwordController= PasswordFormFieldController(ValueKey("txtPassword"),
      required: true,requiredText: "Password field is required");


  register() async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }
    //else{navigationService.pushNamed("/verification");}
    setState(ViewState.Busy);

    RegisterAuth? auth = await request<RegisterAuth>(AuthRequest.register(nameController.text,
        emailController.text, passwordController.text,orgController.text));
    if (auth != null) {
      // locator<PushNotificationService>().configure(mobileNumController.text);
      navigationService.popAllAndPushNamed(Routes.verification,);
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