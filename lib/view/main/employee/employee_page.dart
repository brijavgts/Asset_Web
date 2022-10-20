import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/locator.dart';
import 'package:asset_management/widgets/button.dart';
import 'package:asset_management/widgets/dropdown.dart';
import 'package:asset_management/widgets/tap_outside_unfocus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../../core/res/colors.dart';
import '../../../widgets/edit_text_field.dart';
import 'employee_viewmodel.dart';


 class EmployeePage extends ViewModelBuilderWidget<EmployeeViewModel> {



  @override
  Widget builder(BuildContext context, EmployeeViewModel viewModel,
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

                                  Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                          Expanded(
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                      Text("Employees",
                                                          style: AppTextStyle
                                                              .subHeading,),
                                                      Text("You have ""${viewModel.selectedEmployes.isNotEmpty
                                                          ? viewModel.selectedEmployes.length
                                                          : viewModel.employes.length} "
                                                          "employes, Holding worth"
                                                          "₹${viewModel
                                                          .employes[1].worth}",
                                                          style: AppTextStyle
                                                              .body5.copyWith(
                                                              color: AppColor
                                                                  .nav),
                                                          // ${viewModel.selectedEmployes.isNotEmpty ? viewModel.selectedEmployes[1].worth! : viewModel.employes[1].worth
                                                      ),
                                                  ],
                                              ),
                                          ),

                                          if(constraints.maxWidth >= 800)Row(
                                              children: [
                                                  SizedBox(
                                                      height: 36,
                                                      child: Button.outline(
                                                          "",
                                                          key: ValueKey(
                                                              "filterKey"),
                                                          onPressed: () {
                                                              viewModel.filter = !viewModel.filter;
                                                              viewModel
                                                                  .notifyListeners();
                                                          },
                                                          icon: Row(
                                                              children: [
                                                                  Icon(Icons
                                                                      .filter_alt_outlined,
                                                                      color: AppColor
                                                                          .primary,
                                                                      size: 20,),
                                                                  Text(viewModel.filter
                                                                      ? "Filter"
                                                                      : "Close Filter",
                                                                      style: AppTextStyle
                                                                          .body5
                                                                          .copyWith(
                                                                          color: AppColor
                                                                              .primary),),
                                                              ],
                                                          ),
                                                      ),
                                                  ),

                                                  SizedBox(width: 16,),

                                                  SizedBox(
                                                      width: 256,
                                                      child: EditTextField("",
                                                          viewModel.searchController,
                                                          //Search Selected
                                                          onChanged: (value) {
                                                              viewModel.searchResult = value;
                                                              viewModel.filterRow = viewModel.employes.where((element) =>
                                                                  element.name!
                                                                      .contains(
                                                                      viewModel
                                                                          .searchResult) ||
                                                                      element
                                                                          .dept!
                                                                          .contains(
                                                                          viewModel
                                                                              .searchResult))
                                                                      .toList();
                                                              viewModel
                                                                  .notifyListeners();
                                                          },

                                                          placeholder: "Search",
                                                          prefixIcon: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 8.0),
                                                              child: Icon(
                                                                  CupertinoIcons
                                                                      .search,
                                                                  size: 18,),
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

                                                  SizedBox(width: 16,),

                                                  SizedBox(
                                                      width: 156,
                                                      height: 36,
                                                      child: Button("",
                                                          key: ValueKey(
                                                              "assetKey"),
                                                          onPressed: () {
                                                              dialogService
                                                                  .newEmpDialog();
                                                          },
                                                          icon: Row(
                                                              children: [
                                                                  Icon(Icons
                                                                      .person_add_alt_1_outlined,
                                                                      color: AppColor
                                                                          .white,),
                                                                  SizedBox(
                                                                      width: 8.67,),
                                                                  Text(
                                                                      "New Employee",
                                                                      style: AppTextStyle
                                                                          .body2SemiBold
                                                                          .copyWith(
                                                                          color: AppColor
                                                                              .white,
                                                                          fontSize: 14),)
                                                              ],
                                                          ),
                                                      ),
                                                  ),
                                              ],
                                          ),


                                          if(constraints.maxWidth < 800) Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .end,
                                              children: [
                                                  SizedBox(
                                                      width: width * 0.4,
                                                      child: EditTextField("",
                                                          viewModel.searchController,
                                                          //Search Selected
                                                          onChanged: (value) {
                                                              viewModel.searchResult = value;
                                                              viewModel.filterRow = viewModel.employes.where((element) =>
                                                                  element.name!.contains(
                                                                      viewModel.searchResult) || element.dept!.contains(
                                                                          viewModel.searchResult))
                                                                      .toList();
                                                              viewModel.notifyListeners();
                                                          },

                                                          placeholder: "Search",
                                                          prefixIcon: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 8.0),
                                                              child: Icon(
                                                                  CupertinoIcons
                                                                      .search,
                                                                  size: 18,),
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
                                                  Row(
                                                      children: [
                                                          Tooltip(
                                                              message: viewModel.filter ? "Filter" : "Close Filter",
                                                            child: IconButton(
                                                                onPressed: () {
                                                                    viewModel.filter = !viewModel.filter;
                                                                    viewModel.notifyListeners();
                                                                },
                                                                icon: Icon(viewModel.filter ? Icons
                                                                    .filter_alt_outlined :
                                                                    Icons.filter_alt_off_outlined,
                                                                    color: AppColor
                                                                        .primary,
                                                                    size: 20,) ,),
                                                          ),
                                                          Tooltip(
                                                              message:"New Employee",
                                                            child: IconButton(
                                                                onPressed: () {
                                                                    dialogService
                                                                        .newEmpDialog();
                                                                },
                                                                icon: Icon(Icons
                                                                    .person_add_alt_1_outlined,
                                                                    color: AppColor
                                                                        .primary,
                                                                    size: 20,),),
                                                          )
                                                      ],
                                                  ),
                                              ],
                                          ),
                                      ],
                                  ),

                                  SizedBox(height:16,),

                                  viewModel.filter ? Text("")
                                  :Row(
                                      children: [

                                          Padding(
                                              padding:  EdgeInsets.only(left: 8.0),
                                              child: Icon(Icons.filter_alt_outlined,
                                                  size: 20,),
                                          ),

                                          Text("Department: ",style: AppTextStyle.body3,),

                                          SizedBox(
                                              width: 200,
                                            child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    icon: Icon(CupertinoIcons.chevron_down,size: 12),
                                                    style: AppTextStyle.body3,

                                                    onChanged: (String? newValue){
                                                        viewModel.dropDownvalue = newValue!;
                                                        viewModel.filterRow = viewModel.employes.where((element) =>
                                                            element.dept!.contains(viewModel.dropDownvalue )).toList();
                                                        viewModel.notifyListeners();
                                                    },

                                                    value:viewModel.dropDownvalue,
                                                    items:viewModel.items.map((String item) {
                                                        return DropdownMenuItem(
                                                            alignment: Alignment.center,
                                                            value: item,
                                                            child: Padding(
                                                              padding: EdgeInsets.all(3.0),
                                                              child: Text(item),
                                                            ),
                                                        );
                                                    }).toList(),
                                                ),
                                            ),
                                          ),
                                      ],
                                  ),

                                  SizedBox(height: 8,),

                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: ClampingScrollPhysics(),
                                      child: viewModel.buildDataTable(context),
                                  ),
                              ],
                          );
                      }
                  ),
              ),
          ),
      );
  }

  @override
  EmployeeViewModel viewModelBuilder(BuildContext context) => EmployeeViewModel();

}



