

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../../../core/res/colors.dart';
import '../../../../core/res/images.dart';
import '../../../../core/res/styles.dart';
import '../../../../vgts_base_view_model.dart';

class Item {
  String? image;
  String? name;
  String? warrent;
  String? issue;
  double? worth;

  Item({ required this.name, required this.warrent, required this.issue, required this.worth,required this.image});
}

class EmployeeProfileViewModel extends VGTSBaseViewModel {


  String dropDownvalue ="All";

  List<Item> items =[
    Item( name: "Panton Chair", warrent: "Expires in 00 months", issue: "00 May, 0000", worth: 1.00, image: Images.appLogo),
    Item( name: "Aanton Chair", warrent: "Expires in 00 months", issue: "00 May, 0000", worth: 6.00, image: Images.appLogo),
    Item( name: "Banton Chair", warrent: "Expires in 00 months", issue: "00 May, 0000", worth: 9.00, image: Images.appLogo),
    Item( name: "Canton Chair", warrent: "Expires in 00 months", issue: "00 May, 0000", worth: 5.00, image: Images.appLogo),
  ];

  bool sort=true;

  final columns=["Item Name","Warrent State","Issue On","Worth Today",];

  int indexColumn=0;

  Widget buildDataTable(BuildContext context){

    var width=MediaQuery.of(context).size.width;

    List<DataColumn>getColumns(List<String> columns) => columns.map((String column) => DataColumn(
        onSort: ((columnIndex, ascending) {
          this.indexColumn=columnIndex;
          sort = !sort;
          notifyListeners();
          onSortColum(columnIndex, ascending);
        }),
        label: Expanded(child: Text(column,style: AppTextStyle.body2)))).toList();


    List<DataRow> getRows (List<Item> items) => items
        .map((Item item) => DataRow(
        cells: [
          DataCell(Container(
             width: width * 0.6 ,
            child: Row(
              children: [
                Container(
                  decoration:BoxDecoration(
                    image: DecorationImage(image: AssetImage(item.image!), fit: BoxFit.fill),),
                  width: 72,
                  height: 40,
                ),
                Expanded(child: Text(item.name!,style: AppTextStyle.body3)),
              ],
            ),),),

          DataCell(Container(
            width: width*0.14,
            child: Text(item.warrent!,style: AppTextStyle.body3),),),

          DataCell(Container(
              width: width*0.13,
              child: Text(item.issue!,style: AppTextStyle.body3))),

          DataCell(Container(
              width: width*0.13,
              child: Text("${item.worth!}",style: AppTextStyle.body3))),
        ])).toList();


    return Container(
      width: width,
      child: DataTable(
          sortAscending: sort,
          sortColumnIndex: indexColumn,
          border: TableBorder(verticalInside: BorderSide(width: 0.2),top: BorderSide(width: 0.2),bottom: BorderSide(width: 0.2)),
          dividerThickness: 0.4,
          columns: getColumns(columns),
          rows:getRows (items)),
      // rows:getRows (filterRow.isEmpty || filter ? employes : filterRow)),
    );
  }

  onSortColum(int columnIndex, bool ascending) {

    if (columnIndex == 0) {
      if (ascending) {
        items.sort((a, b) => a.name!.compareTo(b.name!));
      } else {
        items.sort((a, b) => b.name!.compareTo(a.name!));
      }
    }

    else if(columnIndex ==3){
      if (ascending) {
        items.sort((a, b) => a.worth!.compareTo(b.worth!));
      } else {
        items.sort((a, b) => b.worth!.compareTo(a.worth!));
      }
    }
  }


  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

}