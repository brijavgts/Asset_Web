import 'dart:ui';

import 'package:flutter/material.dart';

// Color Palette follows material guide
class AppColor {

  static const Color background = Color(0xFFFAFAFA);

  //Text
  static const Color black=Color(0xFF000000);
  static const Color black5=Color(0x0D000000);
  static const Color hint = Color(0xFF999999);

  //Container Color
  static const Color rd=Color(0xFFFDC3BB);
  static const Color pm=Color(0xFFD6BEEA);
  static const Color store=Color(0xFFF7C8A3);
  static const Color admin=Color(0xFFFCDFA1);
  static const Color hr=Color(0xFFB3D6EB);
  static const Color production=Color(0xFFBEE9BA);

  //Button
  static const Color primary = Color(0xFF104BFC);
  static const Color nav=Color(0xFF666666);

  // Primary
  static const Color primaryOnLight = Color(0xFF9E69FD);
  static const Color primaryOnDark = Color(0xFF3A0282);
  static const Color primaryOnHover = Color(0xFF804BDF);
  static  Color primaryOnHoverBackground = Color(0xFF9155FD).withOpacity(0.8);
  static  Color primaryOutline= Color(0xFF9155FD).withOpacity(0.5);

  // Secondary
  static const Color secondary = Color(0xFF8A8D93);
  static const Color secondaryLight = Color(0xFF9C9FA4);
  static const Color secondaryDark = Color(0xFF4D5056);
  static const Color secondaryHoverBackground= Color(0xFF777B82);
  static  Color secondaryOutlineHover = Color(0xFF8A8D93).withOpacity(0.8);
  static const Color secondaryOutline = Color(0xFF8A8D93);

  //text
  static const Color textOnPrimary = Color(0xFF3A3541);
  static  Color textOnSecondary = const Color(0xFF000000).withOpacity(0.68);
  static  Color textOnDisabled = Color(0xFF3A3541).withOpacity(0.38);


  //Info
  static const Color info = Color(0xFF16B1FF);
  static const Color infoOnLight = Color(0xFF32BAFF);
  static const Color infoOnDark = Color(0xFF0E71A3);
  static const Color infoOnHover = Color(0xFF139CE0);
  static  Color infoOnHoverBackground = Color(0xFF32BAFF).withOpacity(0.8);
  static  Color infoOutline= Color(0xFF32BAFF).withOpacity(0.50);

  //success
  static const Color success = Color(0xFF56CA00);
  static const Color successOnLight = Color(0xFF6AD01F);
  static const Color successOnDark = Color(0xFF378100);
  static const Color successOnHover = Color(0xFF4CB200);
  static  Color successOnHoverBackground = Color(0xFF56CA00).withOpacity(0.8);
  static  Color successOutline= Color(0xFF56CA00).withOpacity(0.50);

  //warning
  static const Color warning = Color(0xFFFFB400);
  static const Color warningOnLight = Color(0xFFFFB547);
  static const Color warningOnDark = Color(0xFFA37300);
  static const Color warningOnHover = Color(0xFFE09E00);
  static  Color warningOnHoverBackground = Color(0xFFFFB400).withOpacity(0.8);
  static  Color warningOutline= Color(0xFFFFB400).withOpacity(0.50);

  //error
  static const Color error = Color(0xFFFF4C51);
  static const Color errorOnLight = Color(0xFFFF6166);
  static const Color errorOnDark = Color(0xFFA33134);
  static const Color errorOnHover = Color(0xFFE04347);
  static  Color errorOnHoverBackground = Color(0xFFFF4C51).withOpacity(0.8);
  static  Color errorOutline= Color(0xFFFF4C51).withOpacity(0.50);

  //action
  static  Color action = Color(0xFF3A3541).withOpacity(0.54);
  static  Color actionHover = Color(0xFF3A3541).withOpacity(0.4);
  static  Color actionSelected = Color(0xFF3A3541).withOpacity(0.8);
  static  Color actionDisabled = Color(0xFF3A3541).withOpacity(0.26);
  static  Color actionDisabledBC = Color(0xFF3A3541).withOpacity(0.12);
  static  Color actionFocus = Color(0xFF3A3541).withOpacity(0.12);

  static const Color primaryContainer = Color(0x4DF67664);
  static const Color textOnPrimaryContainer = Color(0xFFF67664);
  static const Color white = Color(0xFFFFFFFF);
  static const Color secondaryBackground = Color(0xFFF5F5F5);


  // Additional
  static const Color textOnError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0x4DB4251E);
  static const Color textOnErrorContainer = Color(0xFF8B1913);
  static  Color divider = Color(0xFF3A3541).withOpacity(0.12);
  static  Color outLineBorder = Color(0xFF3A3541).withOpacity(0.23);
  static  Color inputLine = Color(0xFF3A3541).withOpacity(0.22);
  static  Color overlay =  Color(0xFF3A3541).withOpacity(0.50);
  static const Color snackBarBg =  Color(0xFF212121);

  static const Color iconColor = Color(0xFF3A3541);
  static const Color grey = Color(0xFF8A8D93);
  static const Color lightGrey = Color(0xFFCCCCCC);
  static const Color green = Color(0xFF0C8021);
  static const Color green60 = Color(0xFF56CA00);
  static const Color yellow0 = Color(0xFFFFB400);


}