import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/view/main/assets/asset_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../../core/enum/view_state.dart';
import '../../../vgts_base_view_model.dart';

class AssetViewModel extends VGTSBaseViewModel {

  List<Emplopyee> employes=[
    Emplopyee(name: "Brija", dept: "Mobile", asset: "Mac", worth: "\$1000000", profile: AssetImage("assets/images/Frame 349.png"),),
    Emplopyee(name: "Brija", dept: "Mobile", asset: "Mac", worth: "\$1000000", profile: AssetImage("assets/images/Frame 349.png"),),
    Emplopyee(name: "Brija", dept: "Store", asset: "Mac", worth: "\$1000000", profile: AssetImage("assets/images/Frame 349.png"),),
    Emplopyee(name: "Brija", dept: "Mobile", asset: "Mac", worth: "\$1000000", profile: AssetImage("assets/images/Frame 349.png"),),
  ];
  List<Emplopyee> selectedEmployes=[];
  final columns=["Employee Name","Department","Asset","Worth"];



  Widget buildDataTable(){
    return DataTable(

        border: TableBorder(verticalInside: BorderSide(width: 0.2),top: BorderSide(width: 0.2),bottom: BorderSide(width: 0.2)),
        dividerThickness: 0.4,

        onSelectAll: (isSelectedAll){
           selectedEmployes = isSelectedAll! ? employes : [];
           notifyListeners();
        },
        columns: getColumns(columns),
        rows:getRows (employes));
  }

  List<DataRow> getRows (List<Emplopyee> employes) => employes
  .map((Emplopyee employe) => DataRow(
      selected:selectedEmployes.contains(employe),
      onSelectChanged: (isSelected) {
        final isAdding = isSelected != null && isSelected;
        isAdding ? selectedEmployes.add(employe):selectedEmployes.remove(employe);
      notifyListeners();
        },

      cells: [
        DataCell(Row(
          children: [
            CircleAvatar(backgroundImage: employe.profile,radius: 15,),
            SizedBox(width: 8,),
            Text(employe.name!,style: AppTextStyle.body3.copyWith(fontSize: 14),),
          ],
        )),
        DataCell(Container(

            child: Text(employe.dept!,style: AppTextStyle.body3.copyWith(fontSize: 14)))),
        DataCell(Text(employe.asset!,style: AppTextStyle.body3.copyWith(fontSize: 14))),
        DataCell(Text(employe.worth!,style: AppTextStyle.body3.copyWith(fontSize: 14))),
      ])).toList();



  List<DataColumn>getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(label: Text(column,style: AppTextStyle.body2.copyWith(fontSize: 14),))).toList();


  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();


  TextFormFieldController searchController= TextFormFieldController(ValueKey("logPwd"),
      required: true,requiredText: "Password field is required");


  asset() async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }
    setState(ViewState.Busy);
    setState(ViewState.Idle);
    notifyListeners();
  }
}

class Emplopyee {
  AssetImage profile;
  String? name;
  String? dept;
  String? asset;
  String? worth;

  Emplopyee({required this.profile,required this.name, required this.dept, required this.asset, required this.worth});
}
