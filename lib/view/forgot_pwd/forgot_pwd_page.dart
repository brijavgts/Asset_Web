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
import 'forgot_pwd_viewmodel.dart';



class ForgotPwdPage extends ViewModelBuilderWidget<ForgotPwdViewModel> {

  @override
  Widget builder(BuildContext context, ForgotPwdViewModel viewModel,
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
                child: Center(
                  child: Column(
                    children: [
                      Text("Forgot your password?",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h4Heading.copyWith(
                            fontSize: 32,
                          )),

                      VerticalSpacing.d8px(),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:ResponsiveValue(context,defaultValue:0,valueWhen:[
                              Condition.largerThan(name:TABLET,value: 400.0),
                              Condition.largerThan(name:"K",),
                            ]).value ),
                        child: Text("Enter the email address associated with your account and we’ll send you a link to reset your password.",
                            style: AppTextStyle.body2SemiBold.copyWith(fontSize: 14,),
                          textAlign: TextAlign.center,
                        ),
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

                      VerticalSpacing.custom(value: 18.0),

                      SizedBox(
                        width: 440,
                        child: Button(
                          "Send email",textStyle: AppTextStyle.body2.copyWith(fontSize: 14,
                            color: AppColor.white,
                            fontWeight: FontWeight.w500),
                          key: const ValueKey("forgotKey"),
                          width: double.infinity,
                          isLoading: viewModel.state == ViewState.Busy,
                          onPressed: () {
                            viewModel.register();
                            //navigationService.popAllAndPushNamed("/main");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

  @override
  ForgotPwdViewModel viewModelBuilder(BuildContext context) => ForgotPwdViewModel();

}

