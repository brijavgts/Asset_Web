//import 'package:asset_management/ui/views/splash/splash_view_model.dart';

import 'package:asset_management/view/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/res/colors.dart';
import '../../../core/res/images.dart';

class SplashPage extends ViewModelBuilderWidget<SplashViewModel> {

  String path;
  SplashPage({this.path = ''});

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    viewModel.init(path);
    super.onViewModelReady(viewModel);
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();

  @override
  Widget builder(BuildContext context, SplashViewModel viewModel, Widget? child) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            color: AppColor.background,
            child: Center(
              child: Text("🚀"),
              //child: Image.asset(Images.appLogo, fit: BoxFit.fill, width: 150,),
            )
        )
    );
  }

}


/*
    VerifyEmailAuth? auth = await request<VerifyEmailAuth>(AuthRequest.forgot_pwd(PreferenceService.hashedMail));

    try {
      if (preferenceService.getHashedEmail().isNotEmpty) {
        if (auth != null) {
          navigationService.popAllAndPushNamed(Routes.main);
        }


      }
      Future.delayed(const Duration(milliseconds: 500), () {
        navigationService.popAllAndPushNamed(Routes.login);
      });

    }  catch (ex) {
      debugPrint("EXCEPTION $ex");
    }*/