import 'dart:js';

import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/view/main/assets/asset_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../../core/enum/view_state.dart';
import '../../../core/res/images.dart';
import '../../../vgts_base_view_model.dart';

class Emplopyee {
  String profile;
  String? name;
  String? dept;
  String? asset;
  String? worth;
  Color? color;

  Emplopyee({required this.profile,required this.name, required this.dept, required this.asset, required this.worth,required this.color});
}


class EmployeeViewModel extends VGTSBaseViewModel {



  List<Emplopyee> employes=[
    Emplopyee(name: "Seyit Mehmet Sansi", dept: "(R&D) Research & Development", asset: "00", worth: "₹99,99,99,999.99", profile: Images.appLogo, color: AppColor.rd),
    Emplopyee(name: "Jenny Wilson", dept: "Project Management", asset: "00", worth: "₹99,99,99,999.99", profile: Images.appLogo, color: AppColor.pm,),
    Emplopyee(name: "Muazzez Yasar", dept: "Store", asset: "00", worth: "₹99,99,99,999.99", profile:Images.appLogo, color: AppColor.store),
    Emplopyee(name: "Brooklyn Simmons", dept: "Administration", asset: "00", worth: "₹99,99,99,999.99", profile:Images.appLogo, color: AppColor.admin),
    Emplopyee(name: "Hamide Alici", dept: "Administration", asset: "00", worth: "₹99,99,99,999.99", profile:Images.appLogo, color: AppColor.admin),
    Emplopyee(name: "Resul Ustaalioglu", dept: "Human Resource", asset: "00", worth: "₹99,99,99,999.99", profile:Images.appLogo, color: AppColor.hr),
    Emplopyee(name: "Tuncay Sahin", dept: "Production", asset: "00", worth: "₹99,99,99,999.99", profile:Images.appLogo, color: AppColor.production),

  ];
  List<Emplopyee> selectedEmployes=[];


  String searchResult ="";

  TextFormFieldController searchController= TextFormFieldController(ValueKey("searchPwd"),);

   bool sort=true;

  final columns=["Employee Name","Department","Asset","Worth"];


  int indexColumn=0;

  Widget buildDataTable(BuildContext context){
    var width=MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: DataTable(
          sortAscending: sort,
          sortColumnIndex: indexColumn,
          border: TableBorder(verticalInside: BorderSide(width: 0.2),top: BorderSide(width: 0.2),bottom: BorderSide(width: 0.2)),
          dividerThickness: 0.4,
          onSelectAll: (isSelectedAll){
            selectedEmployes = isSelectedAll! ? employes : [];
            notifyListeners();
          },
          columns: getColumns(columns),
          rows:getRows (employes)),
    );
  }

  onSortColum(int columnIndex, bool ascending) {

    if (columnIndex == 0) {
      if (ascending) {
        employes.sort((a, b) => a.name!.compareTo(b.name!));
      } else {
        employes.sort((a, b) => b.name!.compareTo(a.name!));
      }
    }

    else if(columnIndex ==1){
      if (ascending) {
        employes.sort((a, b) => a.dept!.compareTo(b.dept!));
      } else {
        employes.sort((a, b) => b.dept!.compareTo(a.dept!));
      }
    }

    else if(columnIndex ==2){
      if (ascending) {
        employes.sort((a, b) => a.asset!.compareTo(b.asset!));
      } else {
        employes.sort((a, b) => b.asset!.compareTo(a.asset!));
      }
    }

    else if(columnIndex ==3){
      if (ascending) {
        employes.sort((a, b) => a.worth!.compareTo(b.worth!));
      } else {
        employes.sort((a, b) => b.worth!.compareTo(a.worth!));
      }
    }
  }


  List<DataColumn>getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
    onSort: ((columnIndex, ascending) {
      this.indexColumn=columnIndex;
     sort = !sort;
     notifyListeners();
     onSortColum(columnIndex, ascending);
    }),
      label: Text(column,style: AppTextStyle.body2.copyWith(fontSize: 14),))).toList();



  List<DataRow> getRows (List<Emplopyee> employes) => employes
      .map((Emplopyee employe) => DataRow(
      selected:selectedEmployes.contains(employe),
      onSelectChanged: (isSelected) {
        final isAdding = isSelected != null && isSelected;
        isAdding ? selectedEmployes.add(employe):selectedEmployes.remove(employe);
        notifyListeners();
      },
      cells: [

        DataCell(Container(
          width: 616.w,
          child: Row(
            children: [
             Container(
               child: Center(child: Text(employe.name!.substring(0,1))),
               width: 24,height: 24,decoration: BoxDecoration(color: employe.color,borderRadius: BorderRadius.circular(12)),),
              SizedBox(width: 8,),
              Text(employe.name!,style: AppTextStyle.body3.copyWith(fontSize: 14),),
            ],
          ),
        )),

        DataCell(Container(
          // width: 279.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
            color:employe.color),
          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
            child: Text(employe.dept!,style: AppTextStyle.body3.copyWith(fontSize: 14)),
        )),

        DataCell(Container(
            // width: 130,
            child: Text(employe.asset!,style: AppTextStyle.body3.copyWith(fontSize: 14)))),

        DataCell(Container(
          // width: 178,
            child: Text(employe.worth!,style: AppTextStyle.body3.copyWith(fontSize: 14)))),
      ])).toList();


  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();







  // asset() async {
  //
  //   if(registerFormKey.currentState?.validate() != true) {
  //     return;
  //   }
  //   setState(ViewState.Busy);
  //   setState(ViewState.Idle);
  //   notifyListeners();
  // }
}

