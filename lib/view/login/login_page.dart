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
import 'login_page_viewmodel.dart';


class LogInPage extends ViewModelBuilderWidget<LogInViewModel> {

  @override
  Widget builder(BuildContext context, LogInViewModel viewModel,
      Widget? child) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: TapOutsideUnFocus(
          child: Form(
            key: viewModel.registerFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 150,),
                child: Column(
                  children: [
                    Text("Login",
                        style: AppTextStyle.h4Heading.copyWith(
                          fontSize: 32,
                        )),

                    VerticalSpacing.d8px(),

                    Text("Welcome back.",
                        style: AppTextStyle.body2SemiBold.copyWith(fontSize: 14,)
                    ),

                    VerticalSpacing.custom(value:24),

                    SizedBox(
                      width: 440,
                      child: EditTextField(
                        "Email",
                        textStyle: AppTextStyle.inputText.copyWith(fontSize: 16),
                        viewModel.emailController,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 4.0, left: 4.0),
                        ),
                        onChanged: (value) {},
                        onSubmitted: (val) {
                          FocusNode().requestFocus();
                        },
                      ),
                    ),

                    VerticalSpacing.d18px(),

                    SizedBox(
                      width: 440,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 40,
                            right: 0.2,
                            child: TextButton(onPressed: (){
                              navigationService.pushNamed("/forgot_pwd");
                            },
                                child: Text("Forgot your password?",
                                  style: AppTextStyle.label.copyWith(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline
                                  ),
                                )),
                          ),
                          EditTextField.password(
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
                        ],
                      ),
                    ),

                    VerticalSpacing.custom(value: 18.0),

                    SizedBox(
                      width: 440,
                      child: Button(
                        "Login",textStyle: AppTextStyle.body2.copyWith(fontSize: 14,
                          color: AppColor.white,
                          fontWeight: FontWeight.w500),
                        key: const ValueKey("logKey"),
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
                        Text("Don’t have an account?",
                            style: AppTextStyle.body2.copyWith(fontSize: 14)),
                        TextButton(
                          onPressed: () {
                            navigationService.pushNamed("/register",);
                          },
                          child: Text("Join service name",
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
  LogInViewModel viewModelBuilder(BuildContext context) => LogInViewModel();

}

