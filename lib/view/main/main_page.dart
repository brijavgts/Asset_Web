
import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/view/change_pwd/change_pwd_page.dart';
import 'package:asset_management/view/forgot_pwd/forgot_pwd_page.dart';
import 'package:asset_management/view/login/login_page.dart';
import 'package:asset_management/view/register/register_page.dart';
import 'package:asset_management/widgets/button.dart';
import 'package:asset_management/widgets/edit_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';


import 'assets/asset_page.dart';
import 'main_page_viewmodel.dart';





class MainPage extends ViewModelBuilderWidget<MainPageViewModel>{

  int index;
  MainPage(this.index);

  @override
  void onViewModelReady(MainPageViewModel viewModel) {
    viewModel.init(index);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(BuildContext context, MainPageViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
          child: IndexedStack(
            index: viewModel.index,
            children: [
            Text("welcome"),
            Text("welcome"),
            EmployeePage()
          ],),
        ),
      ),
    );
  }

  @override
  MainPageViewModel viewModelBuilder(BuildContext context) => MainPageViewModel();
}




double collapsableHeight = 0.0;
Color selected =AppColor.primary;
Color notSelected = AppColor.nav;



class NavBarItem extends StatefulWidget {
  final String text;
  final int index;
  IconData iconData;
  Function() tap;

  NavBarItem({
    required this.text,required this.iconData,required this.tap,required this.index
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  Color color = notSelected;
  BoxDecoration boxDecoration = BoxDecoration(border: Border(bottom: BorderSide.none));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: MouseRegion(
        onEnter: (value) {
          setState(() {
            color = selected;
            boxDecoration = BoxDecoration(border: Border(bottom: BorderSide(color:selected,width: 2)));
          });
        },
        onExit: (value) {
          setState(() {
              color = notSelected;
              boxDecoration = BoxDecoration(border: Border(bottom: BorderSide.none));
          });
        },
        onHover: (value){
          setState(() {
            color = selected;
            boxDecoration = BoxDecoration(border: Border(bottom: BorderSide(color:selected,width: 2)));
          });
        },
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white60,
            onTap: () {
             setState(() {
               widget.tap();
             });
            },
            child: Container(
              decoration: boxDecoration,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Icon(widget.iconData,color: color),
                  Text(widget.text,style: AppTextStyle.body1SemiBold.copyWith(fontSize: 16,color: color),),
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}



