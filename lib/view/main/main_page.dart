
import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/core/res/images.dart';
import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/view/change_pwd/change_pwd_page.dart';
import 'package:asset_management/view/forgot_pwd/forgot_pwd_page.dart';
import 'package:asset_management/view/login/login_page.dart';
import 'package:asset_management/view/main/employee/employee_page.dart';
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

  @override
  Widget builder(BuildContext context, MainPageViewModel viewModel, Widget? child) {
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AnimatedContainer(
            //   margin: EdgeInsets.only(top: 79.0),
            //   duration: Duration(milliseconds: 375),
            //   curve: Curves.ease,
            //   height: (width < 800.0) ? collapsableHeight : 0.0,
            //   width: double.infinity,
            //   color: Colors.blue,
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: navBarItems,
            //     ),
            //   ),
            // ),
            Container(
              color: AppColor.background,
              height: 56.0,
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                 Expanded(
                   flex: 10,
                   child: SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       children: [
                         Icon(CupertinoIcons.circle_grid_3x3_fill),
                        SizedBox(width: 27,),
                         Image.asset(Images.appLogo,width: 235.11,height: 23.9,),
                         SizedBox(width: 24,),
                         VerticalDivider(width: 0.5,indent: 10,endIndent: 10,),


                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: viewModel.navBarItems.asMap().map((key, value) => MapEntry(key,NavBarItem(text: value.text!,iconData: value.iconData!,tap: (){
                             viewModel.index = key;
                             print("Key${key}");
                             viewModel.notifyListeners();
                           },
                           ))).values.toList(),),
                       ],
                     ),
                   ),
                 ),


                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        VerticalDivider(width: 0.5,indent: 10,endIndent: 10,),

                       SizedBox(width: 39,),

                        IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell)),

                        SizedBox(width: 24,),

                      CircleAvatar(
                        backgroundImage: AssetImage(Images.appLogo),
                      ),
                    ],),
                  ),
                ],
              ),
            ),

            Divider(height: 0.5,color: Color(0xFF999999),),



            Container(
              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
              child: IndexedStack(
                index: viewModel.index,
                children: [
                Text("hello"),
                Text("welcome"), EmployeePage(),
              ],),
            )

          ],
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



// class NavBarButton extends StatefulWidget {
//   final Function onPressed;
//
//   NavBarButton({
//     required this.onPressed,
//   });
//
//   @override
//   _NavBarButtonState createState() => _NavBarButtonState();
// }
//
// class _NavBarButtonState extends State<NavBarButton> {
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55.0,
//       width: 60.0,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Color(0xcfffffff),
//           width: 2.0,
//         ),
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: InkWell(
//           splashColor: Colors.white60,
//           onTap: () {
//             setState(() {
//               widget.onPressed();
//             });
//           },
//           child: Icon(
//             Icons.menu,
//             size: 30.0,
//             color: Color(0xcfffffff),
//           ),
//         ),
//       ),
//     );
//   }
// }



class NavBarItem extends StatefulWidget {
  final String text;
  IconData iconData;
  Function() tap;

  NavBarItem({
    required this.text,required this.iconData,required this.tap
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
            boxDecoration=BoxDecoration(border: Border(bottom: BorderSide(color:selected,width: 2)));
          });
        },
        onExit: (value) {
          setState(() {
            color = notSelected;
            boxDecoration=BoxDecoration(border: Border(bottom: BorderSide.none));

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



