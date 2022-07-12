


import 'package:asset_management/core/enum/view_state.dart';
import 'package:asset_management/view/main/main_page.dart';
import 'package:asset_management/view/register/register_page.dart';
import 'package:asset_management/view/register/register_page_viewmodel.dart';
import 'package:asset_management/view/register/verfy_register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import '../../core/model/service/auth/verify_mail_auth.dart';
import '../../locator.dart';
import '../../router.dart';
import '../../services/api_request/auth_request.dart';
import '../../vgts_base_view_model.dart';

class VerifyRegisterPage extends ViewModelBuilderWidget<VerifyRegisterViewModel> {

  String email;
  VerifyRegisterPage({required this.email});

  @override
  void onViewModelReady(VerifyRegisterViewModel viewModel) {
    viewModel.init(email);
    super.onViewModelReady(viewModel);
  }

  @override
  VerifyRegisterViewModel viewModelBuilder(BuildContext context) =>  VerifyRegisterViewModel();

  @override
  Widget builder(BuildContext context, VerifyRegisterViewModel viewModel, Widget? child) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}





