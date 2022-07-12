import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/locator.dart';
import 'package:asset_management/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/res/colors.dart';
import '../../../widgets/edit_text_field.dart';
import 'employee_viewmodel.dart';


class EmployeePage extends ViewModelBuilderWidget<EmployeeViewModel> {




  @override
  Widget builder(BuildContext context, EmployeeViewModel viewModel,
      Widget? child) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: EditTextField("",viewModel.searchController,
                  placeholder: "Search",
                  prefixIcon: Padding(
                    padding:EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(CupertinoIcons.search,size: 18,),
                  ),
                ),
              ),
              SizedBox(
                width: 156,height: 36,
                child: Button("",
                  key: ValueKey("assetKey"),
                  onPressed: (){

                  },
                  icon: Row(
                    children: [
                      Icon(Icons.person_add_alt_1_outlined,color: AppColor.white,),
                      SizedBox(width: 8,),
                      Text("New Employee",style:AppTextStyle.body2SemiBold.copyWith(color: AppColor.white,fontSize: 14),)
                    ],
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 20,),
          viewModel.buildDataTable(),

        ],
      ),
    );


  }

  @override
  EmployeeViewModel viewModelBuilder(BuildContext context) => EmployeeViewModel();

}

