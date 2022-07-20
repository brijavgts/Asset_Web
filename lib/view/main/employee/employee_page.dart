import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/locator.dart';
import 'package:asset_management/widgets/button.dart';
import 'package:asset_management/widgets/tap_outside_unfocus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';

import '../../../core/res/colors.dart';
import '../../../widgets/edit_text_field.dart';
import 'employee_viewmodel.dart';


class EmployeePage extends ViewModelBuilderWidget<EmployeeViewModel> {

  @override
  Widget builder(BuildContext context, EmployeeViewModel viewModel,
      Widget? child) {
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: ResponsiveValue(context,defaultValue:256.0,valueWhen:[
                      Condition.smallerThan(name: TABLET,value: 200.0),
                      Condition.equals(name: MOBILE)]).value,
                    child: EditTextField("",viewModel.searchController,
                      //Search Selected
                      onChanged: (value){
                      viewModel.searchResult = value;
                      viewModel.selectedEmployes = viewModel.employes.where((element) => element.name!.contains(viewModel.searchResult) || element.dept!.contains(viewModel.searchResult)).toList();
                      viewModel.notifyListeners();
                      },

                      placeholder: "Search",
                      prefixIcon: Padding(
                        padding:EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(CupertinoIcons.search,size: 18,),
                      ),

                      // suffixIcon: IconButton(icon: Icon(Icons.cancel),
                      //   onPressed: () {
                      //   viewModel.searchController.clear();
                      //   viewModel.searchResult="";
                      //   viewModel.selectedEmployes.clear();
                      //   viewModel.notifyListeners();
                      //   },),
                    ),
                  ),
                  SizedBox(
                    width: 156,height: 36,
                    child: Button("",
                      key: ValueKey("assetKey"),
                      onPressed: (){
                      dialogService.newEmpDialog();
                      },
                      icon: Row(
                        children: [
                          Icon(Icons.person_add_alt_1_outlined,color: AppColor.white,),
                          SizedBox(width: 8.67,),
                          Text("New Employee",style:AppTextStyle.body2SemiBold.copyWith(color: AppColor.white,fontSize: 14),)
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                child: viewModel.buildDataTable(context),
              )

            ],
          ),
        ),
      ),
    );


  }

  @override
  EmployeeViewModel viewModelBuilder(BuildContext context) => EmployeeViewModel();

}



