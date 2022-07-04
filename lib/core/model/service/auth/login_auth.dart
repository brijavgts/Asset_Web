import '../../base_model.dart';

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