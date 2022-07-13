
import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/router.dart';
import 'package:asset_management/view/main/main_page.dart';
import 'package:asset_management/view/main/main_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class MainLayout extends ViewModelBuilderWidget<MainPageViewModel> {

  Widget contentChild;

  MainLayout(this.contentChild);

  @override
  Widget builder(BuildContext context, MainPageViewModel viewModel, Widget? child) {
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
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.circle_grid_3x3_fill),
                      SizedBox(width: 27,),
                      Image.asset("assets/images/Frame 349.png"),
                      SizedBox(width: 24,),
                      VerticalDivider(width: 0.5,indent: 10,endIndent: 10,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: viewModel.navBarItems.asMap().map((key, value) => MapEntry(key,NavBarItem(text: value.text!,iconData: value.iconData!,tap: (){
                          viewModel.index = key;
                          context.go("${value.path}");
                          viewModel.notifyListeners();
                        }, index:viewModel.index,
                        ))).values.toList().cast<Widget>(),),


                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  VerticalDivider(width: 0.5,indent: 10,endIndent: 10,),



                                  SizedBox(width: 39,),


                                  IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell)),


                                  SizedBox(width: 24,),


                                  CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/Frame 349.png"),
                                  ),
                                ],),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

          Flexible(child: contentChild),

          Text(" FOOTER"),

        ],
      ),
    );
  }

  @override
  MainPageViewModel viewModelBuilder(BuildContext context) {
    return MainPageViewModel();
  }

}