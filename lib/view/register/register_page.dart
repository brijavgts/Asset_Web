import 'package:asset_management/router.dart';
import 'package:asset_management/view/register/register_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
import '../../core/res/colors.dart';
import '../../core/res/images.dart';
import '../../core/res/spacing.dart';
import '../../core/res/styles.dart';
import '../../locator.dart';
import '../../widgets/button.dart';
import '../../widgets/edit_text_field.dart';
import '../../widgets/tap_outside_unfocus.dart';
//import '../widgets/button.dart';
//import '../widgets/edit_text_field.dart';
//import '../widgets/tap_outside_unfocus.dart';
import 'package:http/http.dart' as http;

import '../main/main_page.dart';


class RegisterPage extends ViewModelBuilderWidget<RegisterViewModel> {

  @override
  Widget builder(BuildContext context, RegisterViewModel viewModel,
      Widget? child) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: TapOutsideUnFocus(
          child: Form(
            key: viewModel.registerFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 131.5, 0, 164),
                child: Column(
                  children: [
                    Image.asset("assets/images/Frame 349.png",width: 235.11,height: 23.9,),
                    SizedBox(height: 21.1,),
                    Text("Setup Your Organization",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.h4Heading.copyWith(
                        fontSize: 32,
                      )),

                    VerticalSpacing.custom(value:16),

                    SizedBox(
                      width: 438,
                      child: EditTextField(
                        "Name",
                        viewModel.nameController,
                        textStyle: AppTextStyle.inputText.copyWith(fontSize: 16),
                        placeholder: "Name",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 4.0, left: 4.0),
                        ),
                        onChanged: (value) {},
                        onSubmitted: (val) {
                          FocusNode().requestFocus();
                        },
                      ),
                    ),

                    VerticalSpacing.d16px(),

                    SizedBox(
                      width: 438,
                      child: EditTextField(
                        "Organization Name",
                        textStyle: AppTextStyle.inputText.copyWith(fontSize: 16),
                        viewModel.orgController,
                        placeholder: "Eg: Microsoft",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 4.0, left: 4.0),
                        ),
                        onChanged: (value) {},
                        onSubmitted: (val) {
                          FocusNode().requestFocus();
                        },
                      ),
                    ),

                    VerticalSpacing.d16px(),

                    SizedBox(
                      width: 438,
                      child: EditTextField(
                        "Email",
                        textStyle: AppTextStyle.inputText.copyWith(fontSize: 16),
                        viewModel.emailController,
                        placeholder: "example@gmail.com",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 4.0, left: 4.0),
                        ),
                        onChanged: (value) {},
                        onSubmitted: (val) {
                          FocusNode().requestFocus();
                        },
                      ),
                    ),

                    VerticalSpacing.d16px(),

                    SizedBox(
                      width: 438,
                      child: EditTextField.password(
                        "Password",
                        textStyle: AppTextStyle.inputText.copyWith(fontSize: 16),
                        viewModel.passwordController,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 4.0, left: 4.0),
                        ),
                        onChanged: (value) {},
                        onSubmitted: (val) {
                          FocusNode().requestFocus();
                        },
                      ),
                    ),

                    VerticalSpacing.custom(value: 24.0),

                    SizedBox(
                      width: 438,
                      height: 40,
                      child: Button(
                        "Next",textStyle: AppTextStyle.body2.copyWith(fontSize: 14,
                          color: AppColor.white,
                          fontWeight: FontWeight.w500),
                        key: const ValueKey("regKey"),
                        width: double.infinity,
                        isLoading: viewModel.state == ViewState.Busy,
                        onPressed: () {
                          viewModel.register();
                          //navigationService.popAllAndPushNamed("/main");
                        },
                      ),
                    ),

                    VerticalSpacing.custom(value: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                            style: AppTextStyle.body2.copyWith(fontSize: 14)),
                        TextButton(
                          onPressed: () {
                            navigationService.popAllAndPushNamed(Routes.login);
                          },
                          child: Text("Login",
                              style: AppTextStyle.body2.copyWith(fontSize: 14,
                                  color: AppColor.textOnSecondary,
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) => RegisterViewModel();

}

