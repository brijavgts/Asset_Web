import 'package:asset_management/core/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../core/res/colors.dart';
import '../../core/res/images.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Verfication Link Sent",style: AppTextStyle.h4Heading.copyWith(fontSize: 32),),
            SizedBox(height: 10,),
            Text("Check your inbox we have sent you a verification mail.",style: AppTextStyle.body2.copyWith(fontSize: 14),)
          ],
        ),
      ),

    );
  }
}
