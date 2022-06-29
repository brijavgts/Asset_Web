import 'dart:convert';
import 'package:asset_management/core/model/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  // static const String bearerToken = "BEARERTOKEN";
  // static const String user = "USER";
  // static const String studentId = "studentId";
  // static const String isParent = "isParent";

  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";


  SharedPreferences? pref;

  init() async {
    pref = await SharedPreferences.getInstance();
  }

  setBearerToken(String value) {
    pref?.setString(accessToken, value);
    debugPrint("Access Token stored successfully");
  }

  String getBearerToken() {
    return pref?.getString(accessToken) ?? "";
  }

  setRefreshToken(String value) {
    pref?.setString(refreshToken, value);
    debugPrint("Refresh Token stored successfully");
  }

  String getRefreshToken() {
    return pref?.getString(refreshToken) ?? "";
  }

  /*setBearerToken(String value) {
    pref?.setString(bearerToken, value);
    debugPrint("Bearer Token stored successfully");
  }*/

  /*setIsParent(bool value) {
    pref?.setBool(isParent, value);
    debugPrint("IsParent stored successfully");
  }*/

  /*String getBearerToken() {
    return pref?.getString(bearerToken) ?? "";
  }*/

  /*bool getIsParent() {
    return pref?.getBool(isParent) ?? false;
  }

  int getStudentId() {
    return pref?.getInt(studentId) ?? 0;
  }*/
  //-------
  // User Object
  //
  /*setUser(LoginAuth? value) {
    if (value == null) {
      return;
    }
  //
    pref?.setString(accessToken, value == null ? "" : json.encode(value.toJson()));
    debugPrint("User stored successfully");
  }
  LoginAuth? getUser() {
      String? userString = pref?.getString(accessToken);
      if (userString == null || userString == "null") {
        return null;
      }
      print(LoginAuth.fromJson(jsonDecode(userString)).accessToken);
      return LoginAuth.fromJson(jsonDecode(userString));
    }*/
//------
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
