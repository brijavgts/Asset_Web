import 'package:asset_management/core/model/base_model.dart';
import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/core/res/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../../core/res/images.dart';
import '../../../vgts_base_view_model.dart';
import '../../../widgets/dropdown.dart';

class Emplopyee {
  String profile;
  String? name;
  String? dept;
  String? asset;
  double? worth;
  Color? color;

  Emplopyee({required this.profile,required this.name, required this.dept, required this.asset, required this.worth,required this.color});
}

class Department extends BaseModel {
  int? id;
  String? dept;

  Department({required this.id, required this.dept});
}


class EmployeeViewModel extends VGTSBaseViewModel {

  var items =["All",
    "Owner",
    "Manager",
    "Administration",
    "Project Management",
    "(R&D) Research & Development",
    "Store",
    "Human Resource",
    "Production"
  ];

  String dropDownvalue ="All";

  // DropdownField<Currency>(
  // "Currency Type",
  // viewModel.currencyController,
  // placeholder: "Select Currency Type",
  // margin: EdgeInsets.only(top: 15),
  // onChange: (value) {
  //
  // },
  // ),
  // DropdownFieldController<Currency> currencyController = DropdownFieldController<Currency>(ValueKey("dCurrency"), keyId: "id", valueId: "name");
  // currencyController.list = [
  // Currency(id: 1, name: "INR"),
  // Currency(id: 2, name: "USD"),
  // Currency(id: 3, name: "SBC"),
  // Currency(id: 4, name: "ADS"),
  // Currency(id: 5, name: "FGT"),
  // ];

  ///Dropdown button from widgets
  // @override
  // Future onInit() {
  //   deptController.list = [
  //     Department(id: 1, dept: "dept"),
  //     Department(id: 1, dept: "dept"),
  //     Department(id: 1, dept: "dept"),
  //     Department(id: 1, dept: "dept"),
  //   ];
  //   return super.onInit();
  // }
  //
  // DropdownFieldController<Department> deptController= DropdownFieldController<Department>(
  //   ValueKey("gf"), keyId: "id", valueId: "name",
  // );

  // Container button(){
  //   return Container(
  //     child: DropdownField<Deparment>(
  //       "Currency Type",
  //       deptController,
  //       placeholder: "Select Currency Type",
  //       margin: EdgeInsets.only(top: 15),
  //       onChange: (value) {
  //
  //       },
  //     ),
  //   );
  // }



  List<Emplopyee> employes=[
    Emplopyee(name: "Seyit Mehmet Sansi", dept: "(R&D) Research & Development", asset: "00", worth: 1, profile: Images.appLogo, color: AppColor.rd),
    Emplopyee(name: "Jenny Wilson", dept: "Project Management", asset: "00", worth: 2, profile: Images.appLogo, color: AppColor.pm,),
    Emplopyee(name: "Muazzez Yasar", dept: "Store", asset: "00", worth: 2, profile:Images.appLogo, color: AppColor.store),
    Emplopyee(name: "Brooklyn Simmons", dept: "Administration", asset: "00", worth: 3, profile:Images.appLogo, color: AppColor.admin),
    Emplopyee(name: "Hamide Alici", dept: "Administration", asset: "00", worth: 4, profile:Images.appLogo, color: AppColor.admin),
    Emplopyee(name: "Resul Ustaalioglu", dept: "Human Resource", asset: "00", worth: 4, profile:Images.appLogo, color: AppColor.hr),
    Emplopyee(name: "Tuncay Sahin", dept: "Production", asset: "00", worth: 2, profile:Images.appLogo, color: AppColor.production),

  ];

  DropdownButton? dialogDrop;

  List<Emplopyee> selectedEmployes=[];

  List<Emplopyee> filterRow=[];

  String searchResult ="";

  TextFormFieldController searchController= TextFormFieldController(ValueKey("searchPwd"),);

   bool sort=true;

  bool filter=true;

  final columns=["Employee Name","Department","No of Assets","Worth",];

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
           rows:getRows (filterRow.isEmpty  ? employes : filterRow)),
           // rows:getRows (filterRow.isEmpty || filter ? employes : filterRow)),

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
      label: Expanded(
          child: Text(column,style: AppTextStyle.body2.copyWith(fontSize: 14),)))).toList();



  List<DataRow> getRows (List<Emplopyee> employes) => employes
      .map((Emplopyee employe) => DataRow(
      selected:selectedEmployes.contains(employe),
      onSelectChanged: (isSelected) {
        final isAdding = isSelected != null && isSelected;
        isAdding ? selectedEmployes.add(employe) : selectedEmployes.remove(employe);
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
              Expanded(child: Text(employe.name!,style: AppTextStyle.body3.copyWith(fontSize: 14),)),
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
            child: Text("₹${employe.worth!}",style: AppTextStyle.body3.copyWith(fontSize: 14)))),
      ])).toList();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();


  // DropDown Widget for dialog box
  // dialogDropDown(){
  //   return DropdownButtonHideUnderline(
  //     child: DropdownButton(
  //       icon: Padding(
  //         padding:  EdgeInsets.symmetric(horizontal: 12),
  //         child: Icon(CupertinoIcons.chevron_down,size: 12),
  //       ),
  //       style: AppTextStyle.body3.copyWith(fontSize: 14),
  //       onChanged: (String? newValue){
  //           dropDownvalue = newValue!;
  //         notifyListeners();
  //       },
  //       value:dropDownvalue,
  //       items:items.map((String item) {
  //         return DropdownMenuItem(
  //           value: item,
  //           child: Text(item),
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }

}


// final _transformationController = TransformationController();
// TapDownDetails _doubleTapDetails;
//
// @override
// Widget build(BuildContext context) {
//   return GestureDetector(
//     onDoubleTapDown: _handleDoubleTapDown,
//     onDoubleTap: _handleDoubleTap,
//     child: Center(
//       child: InteractiveViewer(
//         transformationController: _transformationController,
//         /* ... */
//       ),
//     ),
//   );
// }
//
// void _handleDoubleTapDown(TapDownDetails details) {
//   _doubleTapDetails = details;
// }
//
// void _handleDoubleTap() {
//   if (_transformationController.value != Matrix4.identity()) {
//     _transformationController.value = Matrix4.identity();
//   } else {
//     final position = _doubleTapDetails.localPosition;
//     // For a 3x zoom
//     _transformationController.value = Matrix4.identity()
//       ..translate(-position.dx * 2, -position.dy * 2)
//       ..scale(3.0);
//     // Fox a 2x zoom
//     // ..translate(-position.dx, -position.dy)
//     // ..scale(2.0);
//   }
// }
