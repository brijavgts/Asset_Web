
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'fontsize.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {

  static const String fontFamily = "Manrope";

  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColor.primary,
    primaryColorDark: AppColor.primary,
    dividerColor: AppColor.grey,
    indicatorColor: AppColor.primary,
    backgroundColor: AppColor.background,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: AppColor.secondaryBackground,
    appBarTheme: const AppBarTheme(
      color: AppColor.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.textOnPrimary,),
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColor.textOnPrimary,
          letterSpacing: 0.1
      )
    )
  );

  static final List<BoxShadow> cardShadow = [
    BoxShadow(color: Colors.black.withOpacity(0.08), spreadRadius:0, blurRadius:4),
  ];

  static Widget customDivider = SizedBox(height: 0.6, child: Divider(color: AppColor.divider, thickness:1,),);


  static Decoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );

  static final List<BoxShadow> mildCardShadow = [
    BoxShadow(color: AppColor.secondary.withOpacity(0.2), spreadRadius: 0.5, blurRadius: 1),
  ];

  static List<Shadow> textShadow = <Shadow>[
    const Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: Colors.black12,
    ),
    const Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 8.0,
      color: Colors.black12,
    ),
  ];

}

class AppTextStyle {

  //App Heading
  static  TextStyle h4Heading = TextStyle(
      fontSize: AppFontSize.dp32.sp,letterSpacing: 0.25,
      fontWeight: FontWeight.w700,
      //height: 42.sp,
      color: AppColor.black
  );

  static  TextStyle subHeading = TextStyle(
      fontSize: AppFontSize.dp24,letterSpacing: 0.15,
      fontWeight: FontWeight.w700,
      //height: 42.sp,
      color: AppColor.black
  );

  //EditTextField Label
  static  TextStyle label = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.5,
      fontWeight: FontWeight.w600,
      // height: 20.sp,
      color: AppColor.black.withOpacity(0.8)
  );

  static  TextStyle body4 = TextStyle(
      fontSize: AppFontSize.dp14,letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
      color: AppColor.black.withOpacity(0.6),
  );

  static  TextStyle body5 = TextStyle(
      fontSize: AppFontSize.dp14,letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
      // height: 20.sp,
      color: AppColor.black
  );

  // TextButton
  static  TextStyle body2 = TextStyle(
      fontSize: AppFontSize.dp14,letterSpacing: 0.1,
      fontWeight: FontWeight.w600,
      // height: 20.sp,
      color: AppColor.black
  );

  //Text
  static  TextStyle body2SemiBold = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,
      color: AppColor.textOnSecondary
  );

  static  TextStyle body3 = TextStyle(
      fontSize: AppFontSize.dp14,letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
      color: AppColor.black
  );

  //Navigation Text
  static  TextStyle body1SemiBold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.44,
      fontWeight: FontWeight.w500,
      // height: 24.sp,
      color: AppColor.grey
  );



  static  TextStyle h1HeadingLarge = TextStyle(
      fontSize: AppFontSize.dp96.sp,letterSpacing: -1.5,
      fontWeight: FontWeight.w500,
      height: 112.03.sp,
      color: AppColor.textOnPrimary
  );

  static  TextStyle h2Heading = TextStyle(
      fontSize: AppFontSize.dp60.sp,letterSpacing: -0.5,
      fontWeight: FontWeight.w500,height: 72.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle h3Heading = TextStyle(
      fontSize: AppFontSize.dp48.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 56.sp,
      color: AppColor.textOnPrimary
  );


  static  TextStyle h5Heading = TextStyle(
      fontSize: AppFontSize.dp24.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,
     // height: 32.02.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle h6Heading = TextStyle(
      fontSize: AppFontSize.dp20.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 32.sp,
      color: AppColor.textOnPrimary
  );

  static  TextStyle body1 = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w400,height: 24.sp,
      color: AppColor.textOnPrimary
  );


  static  TextStyle subtitle1 = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0,
      fontWeight: FontWeight.w400,height: 24.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle subtitle2 = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 21.98.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle overLine = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 1,
      fontWeight: FontWeight.w400,height: 31.9.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle caption = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.4,
      fontWeight: FontWeight.w400,height: 19.9.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle toast = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.14,
      fontWeight: FontWeight.w400,height: 21.sp,
      color: AppColor.textOnPrimary
  );

//components
  static  TextStyle buttonLarge = TextStyle(
      fontSize: AppFontSize.dp15.sp,letterSpacing: 0.46,
      fontWeight: FontWeight.w500,
      //height: 26.sp,
      color: AppColor.textOnPrimary
  );

  static  TextStyle buttonMedium = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.4,
      fontWeight: FontWeight.w500,height: 24.sp,
      color: AppColor.textOnPrimary
  );

  static  TextStyle buttonMediumCapital = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.4,
      fontWeight: FontWeight.w500,height: 24.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle buttonSmall = TextStyle(
      fontSize: AppFontSize.dp13.sp,letterSpacing: 0.46,
      fontWeight: FontWeight.w500,height: 22.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle inputLabel = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w400,height: 12.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle helperText = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.4,
      fontWeight: FontWeight.w400,height: 20.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle inputText = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w400,
      //height: 24.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle avatarInitials = TextStyle(
      fontSize: AppFontSize.dp18.sp,letterSpacing: 0.14,
      fontWeight: FontWeight.w400,height: 26.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle chip = TextStyle(
      fontSize: AppFontSize.dp13.sp,letterSpacing: 0.16,
      fontWeight: FontWeight.w400,height: 18.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle toolTip = TextStyle(
      fontSize: AppFontSize.dp11.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 16.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle alertTitle = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 24.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle tableHeader = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.17,
      fontWeight: FontWeight.w500,height: 24.sp,
      color: AppColor.textOnPrimary
  );
  static  TextStyle badgeLabel = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.14,
      fontWeight: FontWeight.w500,height: 20.sp,
      color: AppColor.textOnPrimary
  );


}