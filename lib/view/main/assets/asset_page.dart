import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/view/main/assets/asset_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class AssetPage extends ViewModelBuilderWidget<AssetViewModel>{
  @override
  Widget builder(BuildContext context, AssetViewModel viewModel, Widget? child) {
   return Scaffold(
     body: Column(
       children: [

         _Header(),



       ],
     ),
   );
  }

  @override
  AssetViewModel viewModelBuilder(BuildContext context) => AssetViewModel();

}

class _Header extends ViewModelWidget<AssetViewModel>{
  @override
  Widget build(BuildContext context, AssetViewModel viewModel) {
   return Container(
     child: Row(
       children: [

         Text("Categories",style: AppTextStyle.h4Heading.copyWith(fontSize: 24),)


       ],
     ),
   );
  }

}
