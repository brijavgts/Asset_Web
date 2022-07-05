import 'dart:convert';
import 'dart:html';

// import 'package:asset_management/core/model/auth.dart';
import 'package:asset_management/services/api_request/auth_request.dart';
import 'package:asset_management/services/shared/preference_service.dart';
import 'package:asset_management/view/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
import '../../core/model/service/auth/register_auth.dart';
import '../../core/model/service/auth/verify_mail_auth.dart';
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

  PasswordFormFieldController passwordController= PasswordFormFieldController(ValueKey("regPwd"),
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
      preferenceService.setHashedEmail(auth.hashedEmail ?? '');
      Fluttertoast.showToast(msg: "Verifying Email.....");
      // navigationService.popAllAndPushNamed(preferenceService.getHashedEmail().isNotEmpty ? Routes.verification:Routes.verify_register);
    }

//----------------

    VerifyEmailAuth? verifyAuth = await request<VerifyEmailAuth>(AuthRequest.verifyEmail(preferenceService.getHashedEmail()));
    if (auth != null) {
      preferenceService.setAccessToken(verifyAuth?.accessToken ?? '');
      navigationService.popAllAndPushNamed(preferenceService.getAccessToken().isNotEmpty ? Routes.verification:Routes.verify_register);
    }
//--------------------

    setState(ViewState.Idle);
    notifyListeners();
  }

}

/*
Future<String> signIn() async {
      final response = await http.post(
        serverReceiverPath,
        headers: {'Content-Type': 'application/json'},
      );
      if(response.body == 'Login successful'){
        isLogin = true;
      }else{
        isLogin = false;
      }
      print(response.body);
      print(isLogin);
    }

    Correction =>

    if(response.body == 'Login successful'){
    isLogin = true;
    Navigator.of(context).pushReplacementNamed('/home');
  }else{
    isLogin = false;
  }


    */