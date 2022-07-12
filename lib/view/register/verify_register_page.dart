


import 'package:asset_management/view/main/main_page.dart';
import 'package:asset_management/view/register/register_page.dart';
import 'package:asset_management/view/register/register_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import '../../core/model/service/auth/verify_mail_auth.dart';
import '../../locator.dart';
import '../../router.dart';
import '../../services/api_request/auth_request.dart';
import '../../vgts_base_view_model.dart';

class VerifyRegisterPage extends ViewModelBuilderWidget<RegisterViewModel> {


  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    viewModel.onInit();
    super.onViewModelReady(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>  RegisterViewModel();

  @override
  Widget builder(BuildContext context, RegisterViewModel viewModel, Widget? child) {
    return Center(
      child: CircularProgressIndicator(),
    );


  }

}
