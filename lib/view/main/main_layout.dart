
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
          MediaQuery.of(context).size.width > 800 ?  Padding(
            padding: EdgeInsets.fromLTRB(24, 12, 32, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Image.asset(Images.appLogo,width: 235.11,height: 23.9,),
                      SizedBox(width: 23.89,),
                      VerticalDivider(width: 1,),
                      SizedBox(width: 27.12,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: viewModel.navBarItems.asMap().map((key, value) => MapEntry(key,NavBarItem(text: value.text!,iconData: value.iconData!,tap: (){
                          viewModel.index = key;
                          context.goNamed(value.path!,params:{'id': key.toString()});
                          viewModel.notifyListeners();
                        },
                        ))).values.toList(),),
                    ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: viewModel.navBarItems.asMap().map((key, value) => MapEntry(key,NavBarItem(text: value.text!,iconData: value.iconData!,tap: (){
                            viewModel.index = key;
                            context.go(value.path!);
                            print("Key${key}");
                            viewModel.notifyListeners();
                          },
                          ))).values.toList(),),
                      ],
                    ),
                  ),
                ),


                IntrinsicHeight(
                  child: Row(

                    children: [

                      VerticalDivider(width: 1,),

                      SizedBox(width: 27.75,),

                      IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell)),

                      SizedBox(width:31.75,),

                      CircleAvatar(
                        backgroundImage: AssetImage(Images.appLogo),
                      ),
                    ],),
                ),
              ],
            ),
          )
              :Padding(
            padding: EdgeInsets.fromLTRB(24, 12, 32, 12),
                child: Column(
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Image.asset(Images.appLogo,width: 235.11,height: 23.9,),

                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell)),

                        SizedBox(width: 31.75,),

                        CircleAvatar(
                          backgroundImage: AssetImage(Images.appLogo),
                        ),
                      ],),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: viewModel.navBarItems.asMap().map((key, value) => MapEntry(key,NavBarItem(text: value.text!,iconData: value.iconData!,tap: (){
                    viewModel.index = key;
                    context.goNamed(value.path!,params:{'id': key.toString()});
                    viewModel.notifyListeners();
                  },
                  ))).values.toList(),),
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