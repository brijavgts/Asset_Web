
import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/router.dart';
import 'package:asset_management/view/main/nav_bar_item.dart';
import 'package:asset_management/view/main/main_layout_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../core/res/images.dart';

class MainLayout extends ViewModelBuilderWidget<MainLayoutViewModel> {

  Widget contentChild;

  MainLayout(this.contentChild);

  @override
  Widget builder(BuildContext context, MainLayoutViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Column(
        children: [

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

          Flexible(child: contentChild),

          Text(" FOOTER"),

        ],
      ),
    );
  }

  @override
  MainLayoutViewModel viewModelBuilder(BuildContext context) {
    return MainLayoutViewModel();
  }

}