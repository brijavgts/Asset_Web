import 'dart:math';

import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/core/res/spacing.dart';
import 'package:asset_management/core/res/styles.dart';
// import 'package:asset_management/widgets/custom_tool_tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/res/images.dart';

class GridCategory extends StatefulWidget {

  String? image;
  String? name;
  int? cat;
  int? item;
  Function() onTap;
  Function() onHover;
  GridCategory({this.image, this.name, this.cat, this.item, required this.onTap,required this.onHover});

  @override
  State<GridCategory> createState() => _GridCategoryState();
}

class _GridCategoryState extends State<GridCategory> {
  @override
  Widget build(BuildContext context) {
     return Container(
         constraints: BoxConstraints(
           maxWidth: max(395,100),
           maxHeight:max(232,50)
       ),
       decoration: BoxDecoration(
         color: AppColor.background,
         border: Border.all(color: AppColor.lightGrey,width: 1.0),
         borderRadius: BorderRadius.circular(16.0.h,),
       ),
       child: Column(
         children: [

           Padding(
             padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0),
             child: ClipRRect(
                 borderRadius: BorderRadius.circular(8.0),
                 child: Image.network("https://cdn.idropnews.com/wp-content/uploads/2017/07/26133500/MacBook-Pro-Giveaway1.jpg",fit: BoxFit.cover,)),
           ),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
             child: Row(
               children: [
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                        Text(widget.name!,style:AppTextStyle.body2.copyWith(fontSize: 18),textScaleFactor: MediaQuery.of(context).textScaleFactor,),

                        VerticalSpacing.custom(value: 2.0),

                       Row(
                         children: [
                           Text("${widget.cat!} Sub Categories",style:AppTextStyle.body1SemiBold.copyWith(color:AppColor.nav,fontSize: 16,),textScaleFactor: MediaQuery.of(context).textScaleFactor,),

                           SizedBox(height: 12,child: VerticalDivider()),

                           Text("${widget.item!} Items",style: AppTextStyle.body1SemiBold.copyWith(color: AppColor.nav,fontSize: 16),textScaleFactor: MediaQuery.of(context).textScaleFactor,),
                         ],
                       ),
                     ],
                   ),
                 ),

                 MouseRegion(
                   onHover: (value){
                     setState(() {});
                     widget.onHover();
                   },
                 child: Icon(Icons.more_horiz))
               ],
             ),
           ),

         ],
       ),
     );
  }
}