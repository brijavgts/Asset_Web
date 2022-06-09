
import 'package:asset_management/widgets/shimmer_effect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/res/colors.dart';

class LoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        color: AppColor.white,
        child: Column(
          children: [
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
          ],
        ),
      ),
    );
  }

}