import 'dart:math';

import 'package:asset_management/core/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/res/images.dart';
import '../../core/res/styles.dart';

class ListType extends StatefulWidget{

  final List<String> tabList;
  final int initialIndex;
  final Function(int index) onChange;
  ListType({required this.tabList,required this.initialIndex,required this.onChange});

  @override
  State<ListType> createState() => _ListTypeState();
}

class _ListTypeState extends State<ListType> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: max(28,14),
          maxWidth: max(60,30),
        ),
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: AppColor.background,
          border: Border.all(color: AppColor.lightGrey,width: 1.0),
          borderRadius: BorderRadius.circular(4.0.h,),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.tabList.asMap().map((index,e) {
              return MapEntry(index, Expanded(
                child: InkWell(
                  onTap: (){
                    widget.onChange(index);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(6.0),
                      decoration : widget.initialIndex == index ?  BoxDecoration(borderRadius: BorderRadius.circular(4.0.h), color: AppColor.black5) : null,
                      child: Image.asset(e,)),
                ),
              ));}).values.toList()
        ),
      ),
    );

  }
}