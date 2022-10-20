
import 'package:asset_management/view/main/employee/profile_emp/profile_emp_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class EmployeeProfile extends ViewModelBuilderWidget<EmployeeProfileViewModel> {

  @override
  Widget builder(BuildContext context, EmployeeProfileViewModel viewModel,
      Widget? child) {
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: LayoutBuilder(
              builder: (BuildContext context,
                  BoxConstraints constraints) {
                return Column(
                  children: [

                    SizedBox(height: 16,),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      child: viewModel.buildDataTable(context),
                    ),
                  ]
                );
              }
          ),
        ),
      ),
    );
  }

  @override
  EmployeeProfileViewModel viewModelBuilder(BuildContext context) => EmployeeProfileViewModel();

}


