
import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/locator.dart';
import 'package:asset_management/router.dart';
import 'package:asset_management/view/main/nav_bar_item.dart';
import 'package:asset_management/view/main/main_layout_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../core/res/images.dart';

class MainLayout extends ViewModelBuilderWidget<MainLayoutViewModel> {


  Widget contentChild;

  MainLayout(this.contentChild);

  @override
  Widget builder(BuildContext context, MainLayoutViewModel viewModel, Widget? child) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
         return Column(
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
                            Image.asset(Images.appLogo,width: 235.11,height: 23.9,),

                            SizedBox(width: 24,),

                            if(constraints.maxWidth > 800)  VerticalDivider(width: 0.5,indent: 10,endIndent: 10,),

                            SizedBox(width: 26.5,),

                            if(constraints.maxWidth > 800) Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: viewModel.topBarItems.asMap().map((key, value) => MapEntry(key,NavBarItem(
                                text: value.text!,
                                iconData: value.iconData!,
                                tap: (){
                                  viewModel.index = key;
                                context.go(value.path!,extra: {'index': viewModel.index.toString()});
                                print("Key${key}");
                                viewModel.notifyListeners();
                              },
                                position: key,
                                selectPos: viewModel.index,
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

                         if(constraints.maxWidth > 800) VerticalDivider(width: 0.5,indent: 10,endIndent: 10,),

                          SizedBox(width: 39,),

                          IconButton(onPressed: () async{
                              await preferenceService.clearData();
                              await Fluttertoast.showToast(msg: "Logout.....");
                              context.go(Routes.login,);
                          }, icon: Icon(CupertinoIcons.bell)),

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

            ],
          );
        },
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width <= 800 ?

        BottomNavigationBar(
          selectedLabelStyle: AppTextStyle.subtitle2.copyWith(height: 0,fontSize:12,),
          unselectedLabelStyle: AppTextStyle.subtitle2.copyWith(height: 0,fontSize: 10,),
            unselectedItemColor: AppColor.textOnPrimary,
            selectedItemColor: AppColor.primary,
            showSelectedLabels: false,
            // showUnselectedLabels: true,
            iconSize: 20,
            currentIndex: viewModel.index,
            onTap: (int index){
              viewModel.index = index;
              context.go(viewModel.navBarItems[index].path!);
              viewModel.notifyListeners();
            },
            items: [
              ...viewModel.navBarItems.asMap().map((key, value) => MapEntry(key,BottomNavigationBarItem(label: value.text!,activeIcon:Icon(value.iconData!,color: AppColor.primary,) ,
                icon: Icon(value.iconData!,color: AppColor.lightGrey,),
              ))).values.toList()
            ],

          ) : null
    );
  }

  @override
  MainLayoutViewModel viewModelBuilder(BuildContext context) {
    return MainLayoutViewModel();
  }

}