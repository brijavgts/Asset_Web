import 'dart:convert';
// import 'package:asset_management/core/model/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
   // static const String bearerToken = "BEARERTOKEN";
  // static const String user = "USER";
  // static const String studentId = "studentId";
  // static const String isParent = "isParent";

  //Response Token from Login to main
  static const String accessToken = "accessToken";
  static const String token = "token";

  //Response hashedMail from Register to main
  static const String hashedMail ="hashedEmail";


  SharedPreferences? pref;

  init() async {
    pref = await SharedPreferences.getInstance();
  }


  setAccessToken(String value) {
    pref?.setString(accessToken, value);
    debugPrint("Access Token stored successfully");
  }

  String getAccessToken() {
    return pref?.getString(accessToken) ?? "";
  }

  setToken(String value) {
    pref?.setString(token, value);
    debugPrint("Token stored successfully");
  }

  String getToken() {
    return pref?.getString(token) ?? "";
  }

  setHashedEmail(String value) {
    pref?.setString(hashedMail, value);
    debugPrint("Hashed Mail stored successfully");
  }

  String getHashedEmail() {
    return pref?.getString(hashedMail) ?? "";
  }


  /*setBearerToken(String value) {
    pref?.setString(bearerToken, value);
    debugPrint("Bearer Token stored successfully");
  }

  String getBearerToken() {
    return pref?.getString(bearerToken) ?? "";
  }*/

   /*setIsParent(bool value) {
    pref?.setBool(isParent, value);
    debugPrint("IsParent stored successfully");
  }*/


   /*bool getIsParent() {
    return pref?.getBool(isParent) ?? false;
  }

  int getStudentId() {
    return pref?.getInt(studentId) ?? 0;
  }*/

  /*setStudentId (int value) {
    pref?.setInt(studentId,value);
  }*/

  // AuthUserData? getUser() {
  //   String? userString = pref?.getString(user);
  //   if (userString == null || userString == "null") {
  //     return null;
  //   }
  //   print(AuthUserData.fromJson(jsonDecode(userString)).image);
  //   return AuthUserData.fromJson(jsonDecode(userString));
  // }

  clearData() async {
    pref?.clear();
  }

}
