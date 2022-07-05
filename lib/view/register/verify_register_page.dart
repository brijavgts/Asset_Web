


import 'package:asset_management/view/main/main_page.dart';
import 'package:asset_management/view/register/register_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class VerifyRegisterPage extends ViewModelBuilderWidget<RegisterViewModel> {

  @override
  Widget builder(BuildContext context, RegisterViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator() ,
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) {
    return RegisterViewModel();
  }

}