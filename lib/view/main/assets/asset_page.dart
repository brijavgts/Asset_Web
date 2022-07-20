import 'dart:math';

import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/core/res/spacing.dart';
import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/view/main/assets/asset_viewmodel.dart';
import 'package:asset_management/view/shared/grid_category.dart';
import 'package:asset_management/view/shared/list_type_widget.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';
import 'package:stacked/stacked.dart';

import '../../../core/res/images.dart';
import '../../../widgets/button.dart';
import '../../../widgets/edit_text_field.dart';
import '../main_layout_viewmodel.dart';

class AssetPage extends ViewModelBuilderWidget<AssetViewModel> {

  @override
  void onViewModelReady(AssetViewModel viewModel) {
    viewModel.onInit();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(BuildContext context, AssetViewModel viewModel, Widget? child) {
   return Scaffold(
     backgroundColor: AppColor.background,
     body: Container(
       padding: EdgeInsets.only(top: 16.0,left: 24.0,right: 24.0,bottom: 16.0),
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [

             _Header(),


             VerticalSpacing.custom(value: 32.0),

             LayoutBuilder(
               builder: (BuildContext context, BoxConstraints constraints) {
                 print(constraints.toString());
                 print(MediaQuery.of(context).devicePixelRatio);
                 print(MediaQuery.of(context).textScaleFactor);
                 if(viewModel.currentIndex == 0)
                return _GridView(constraints);
                 else
                 return Container();
               },
             )

             // Wrap(
             //     runSpacing: 24,
             //     spacing: 24,
             //     crossAxisAlignment: WrapCrossAlignment.start,
             //     runAlignment: WrapAlignment.start,
             //     alignment: WrapAlignment.start,
             //     children: viewModel.cat.asMap().map((key, value) {
             //         return MapEntry(key, GridCategory(
             //           name: value.name,
             //           image: value.name,
             //           cat: value.subcat,
             //           item: value.item,
             //           onHover: (){
             //           },
             //           onTap: () {
             //           },));
             //       }).values.toList()),


             // Container(
             //     constraints: const BoxConstraints(
             //       minWidth: 200,
             //       maxWidth: 395,
             //     ),
             //     padding: EdgeInsets.only(top: 34, bottom: 34),
             //     margin: EdgeInsets.only(left: 24),
             //     decoration: DottedDecoration(shape: Shape.box, color: AppColor.primary, strokeWidth: 2,),
             //     child: Row(
             //       mainAxisAlignment: MainAxisAlignment.center,
             //       children: [
             //         Icon(Icons.add,size: 15,color: AppColor.primary,),
             //
             //         HorizontalSpacing.d2px(),
             //
             //         Text("New Category",style: AppTextStyle.body2.copyWith(color: AppColor.primary),),
             //       ],
             //     )),


            ],
         ),
       ),
     ),
   );
  }

  @override
  AssetViewModel viewModelBuilder(BuildContext context) => AssetViewModel();
}

class _Header extends ViewModelWidget<AssetViewModel>{
  @override
  Widget build(BuildContext context, AssetViewModel viewModel) {
   return LayoutBuilder(
     builder: (BuildContext context, BoxConstraints constraints) {
       return ConstrainedBox(
         constraints: BoxConstraints(
           maxWidth: max(MediaQuery.of(context).size.width, 500.0),
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [

             Row(
               children: [

               Text("Categories",style: AppTextStyle.h4Heading.copyWith(fontSize: 24),textScaleFactor: MediaQuery.of(context).textScaleFactor,),


               HorizontalSpacing.custom(value: 18.0),

                if(constraints.maxWidth > 800) ListType(
                   initialIndex: viewModel.currentIndex,
                   tabList: [
                     Images.assetsList,
                     Images.assetsGrid,
                   ],
                   onChange: (index) {
                     viewModel.currentIndex = index;
                     viewModel.notifyListeners();
                   },
                 ),
               ],
             ),


            Row(
               children: [

                 if (constraints.maxWidth > 800)  Container(
                   height: 36,
                   width: 256,
                   child: EditTextField("",viewModel.searchController,
                     placeholder: "Search",
                     prefixIcon: const Padding(
                       padding:EdgeInsets.symmetric(horizontal: 8.0),
                       child: Icon(CupertinoIcons.search,size: 18,),
                     ),
                   ),
                 ),

                 HorizontalSpacing.custom(value: 16.0),

                 Container(
                   constraints: BoxConstraints(
                     maxWidth: max(119, 50 ),
                     maxHeight:max(36, 18),
                   ),
                   child: Button("",
                     key: ValueKey("assetKey"),
                     onPressed: (){

                     },
                     icon: Row(
                       children: [
                         Icon(Icons.add,color: AppColor.white,size: 15,),

                         SizedBox(width: 8,),

                         Text("New Asset",style:AppTextStyle.body2SemiBold.copyWith(color: AppColor.white,fontSize: 14),)
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ],
         ),
       );
     },
   );
  }

}

class _GridView extends ViewModelWidget<AssetViewModel> {
  BoxConstraints constraints;
  _GridView(this.constraints);

  @override
  Widget build(BuildContext context, AssetViewModel viewModel) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: viewModel.cat.length,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: constraints.maxWidth >= 1500 ? 5 : constraints.maxWidth >= 1200 ? 4 : constraints.maxWidth >= 800 ? 3 : constraints.maxWidth <= 550 ? 1 : 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: MediaQuery.of(context).devicePixelRatio
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridCategory(
          name: viewModel.cat[index].name,
          image: viewModel.cat[index].name,
          cat:viewModel.cat[index].subcat,
          item: viewModel.cat[index].item,
          onTap: () {
          },
          onHover: () {

          },);
      },
    );
  }
  
}

