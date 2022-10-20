
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/enum/view_state.dart';
import '../../../../core/res/colors.dart';
import '../../../../core/res/images.dart';
import '../../../../core/res/spacing.dart';
import '../../../../core/res/styles.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/edit_text_field.dart';
import '../../../../widgets/tap_outside_unfocus.dart';
import 'helper_invite_emp.dart';
import 'invite_emp_viewmodel.dart';


class EmployeeInvite extends ViewModelBuilderWidget<EmpInviteViewModel> {


  @override
  Widget builder(BuildContext context, EmpInviteViewModel viewModel,
      Widget? child) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: TapOutsideUnFocus(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: viewModel.registerFormKey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 131.0, 0, 152),
                  child: Column(
                    children: [
                      Image.asset(Images.appLogo,width: 235.11,height: 23.9,),
                      SizedBox(height: 21.1,),
                      Text("Setup Your Account",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h4Heading.copyWith(
                            fontSize: 32,
                          )),

                      VerticalSpacing.custom(value:8),

                      SizedBox(
                        width: 374,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: AppTextStyle.body3.copyWith(color: AppColor.nav),
                                children: [
                                  TextSpan(text: "Setup your account linked with "),
                                  TextSpan(text:"harsh@vishgyana.com ",style: AppTextStyle.body3.copyWith(color: AppColor.primary,)),
                                  TextSpan(text:"to get started",)
                                ]
                            )),
                      ),

                      VerticalSpacing.custom(value:16),

                      SizedBox(
                        width: 438,
                        child: EditTextField(
                          "Full Name",
                          viewModel.nameController,
                          textStyle: AppTextStyle.body5,
                          placeholder: "Eg: Harish Kumar",
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

                      Complete(),

                      // Autocomplete<String>(
                      //
                      //     optionsBuilder: (TextEditingValue value){
                      //   if(value.text.isEmpty){
                      //     return [];
                      //   }
                      //   return viewModel.suggestions.where((element) => element
                      //       .toLowerCase()
                      //       .contains(value.text.toLowerCase()));
                      // },
                      // ),
                      // VerticalSpacing.d16px(),
                      //
                      // SizedBox(
                      //   width: 438,
                      //   child: EditTextField(
                      //     "Department",
                      //     textStyle: AppTextStyle.body5,
                      //     viewModel.orgController,
                      //     placeholder: "Eg: Design",
                      //     prefixIcon: Padding(
                      //       padding: EdgeInsets.only(right: 4.0, left: 4.0),
                      //     ),
                      //     onChanged: (value) {},
                      //     onSubmitted: (val) {
                      //       FocusNode().requestFocus();
                      //     },
                      //   ),
                      // ),

                      VerticalSpacing.d16px(),

                      SizedBox(
                        width: 438,
                        child: EditTextField.password(
                          "Set Password",
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
                          key: const ValueKey("inviteKey"),
                          width: double.infinity,
                          isLoading: viewModel.state == ViewState.Busy,
                          onPressed: () {
                            viewModel.inviteEmp(context);
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
  EmpInviteViewModel viewModelBuilder(BuildContext context) => EmpInviteViewModel();

}
