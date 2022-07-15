import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/res/colors.dart';
import '../../core/res/styles.dart';
import 'main_layout_viewmodel.dart';

class TabViewMenu extends StatefulWidget {

  final List<Item>? itemList;
  final Function(int index)? onChange;
  final int? initialIndex;
  final List<Widget>? children;

  TabViewMenu({this.itemList, this.initialIndex, this.onChange, this.children = const []});

  @override
  _TabViewMenuState createState() => _TabViewMenuState();
}

class _TabViewMenuState extends State<TabViewMenu> with SingleTickerProviderStateMixin {

  TabController? controller;

  @override
  void initState() {
    controller = new TabController(length: widget.itemList!.length, initialIndex: widget.initialIndex!, vsync: this);

    controller!.addListener(() {
      setState(() {
        widget.onChange!(controller!.index);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Color color = notSelected;
    BoxDecoration boxDecoration = BoxDecoration(border: Border(bottom: BorderSide.none));

    return Column(
      children: [

        Container(
          width: double.infinity,
          color: AppColor.white,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(CupertinoIcons.circle_grid_3x3_fill),
                    SizedBox(width: 27,),
                    Image.asset("assets/images/Frame 349.png"),
                    SizedBox(width: 24,),
                    VerticalDivider(width: 0.5,indent: 10,endIndent: 10,),
                  ],
                ),
              ),

              Expanded(
                child: TabBar(
                  controller: controller,
                  onTap: (int index) {
                    widget.onChange!(index);
                  },
                  automaticIndicatorColorAdjustment: true,
                  unselectedLabelColor: color,
                  labelColor: AppColor.secondary,
                  labelStyle: AppTextStyle.body1SemiBold.copyWith(fontSize: 16,color: color),
                  unselectedLabelStyle: AppTextStyle.body1SemiBold.copyWith(fontSize: 16,color: color),
                  indicatorWeight: 4.w,
                  indicatorPadding: EdgeInsets.only(left: 20,right: 20.0),
                  indicatorColor:AppColor.secondary,
                  tabs: [
                    ...widget.itemList!.map((e) => MouseRegion(
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
                      child: Container(
                        decoration: boxDecoration,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            Icon(e.iconData,color: color),
                            Text(e.text ?? '',style: AppTextStyle.body1SemiBold.copyWith(fontSize: 16,color: color),),
                          ],
                        ),

                      ),
                    ),).toList()
                  ],
                ),
              ),

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

        Flexible(
            child: SafeArea(
              child: Container(
                height: double.infinity,
                child: TabBarView(
                  controller: controller,
                  children: widget.children!,
                  physics: ClampingScrollPhysics(),
                ),
              ),
            )
        ),

      ],
    );
  }

}

double collapsableHeight = 0.0;
Color selected =AppColor.primary;
Color notSelected = AppColor.nav;