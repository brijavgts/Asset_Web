
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color getColorFromString(String? hexColor, { Color fallbackColor = Colors.transparent }) {
  if (hexColor == null || hexColor == "none" || hexColor == "")
    return fallbackColor;

  // Convert from RGB: rgb(24,23,23)
  if (hexColor.contains('rgb(')){
    List<String> _bgList = hexColor.replaceAll("rgb", '').replaceAll("(", '').replaceAll(")", '').replaceAll(" ", '').split(",");
    return Color.fromRGBO(int.parse(_bgList[0]), int.parse(_bgList[1]), int.parse(_bgList[2]), 1);
  }

  // Convert from Hex Code: #ff2323
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

String convertAmountFormat(String value){
  String amount = "";
  NumberFormat format = NumberFormat("#,##,##0");
  amount = format.format(int.tryParse(value));
  return amount;
}

String numberFormat(int number){

  if(number >= 11 && number <= 13) {
    return 'th';
  }

  switch(number % 10) {
    case 1: return ' st';
    case 2: return ' nd';
    case 3: return ' rd';
    default: return ' th';
  }
}

Color getColorFromHex(String hexColor, { Color fallbackColor = Colors.red }) {

  print(hexColor);

  if(!hexColor.contains("#")){
    return fallbackColor;
  }

  if (hexColor == null || hexColor == "none" || hexColor == ""||hexColor=="PENDING")
    return fallbackColor;

  // Convert from RGB: rgb(24,23,23)
  if (hexColor.contains('rgb(')){
    List<String> _bgList = hexColor.replaceAll("rgb", '').replaceAll("(", '').replaceAll(")", '').replaceAll(" ", '').split(",");
    return Color.fromRGBO(int.parse(_bgList[0]), int.parse(_bgList[1]), int.parse(_bgList[2]), 1);
  }

  // Convert from Hex Code: #ff2323
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}
