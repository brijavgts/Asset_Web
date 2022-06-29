

import 'package:asset_management/core/model/base_model.dart';

//Register
class RegisterAuth extends BaseModel {
  String? name;
  String? emailId;
  String? password;
  String? organizationName;


  RegisterAuth(
      {
        this.name,
        this.emailId,
        this.password,
        this.organizationName,
        });

  RegisterAuth fromJson(Map<String, dynamic> json) => RegisterAuth.fromJson(json);


  RegisterAuth.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    emailId = json['emailId'];
    password = json['password'];
    organizationName = json['organizationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['emailId'] = this.emailId;
    data['password'] = this.password;
    data['organizationName'] = this.organizationName;

    return data;

  }
}

//Login
class LoginAuth extends BaseModel{
  String? accessToken;
  String? refreshToken;

  LoginAuth({this.accessToken, this.refreshToken});

  LoginAuth fromJson(Map<String, dynamic> json) => LoginAuth.fromJson(json);


  LoginAuth.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

