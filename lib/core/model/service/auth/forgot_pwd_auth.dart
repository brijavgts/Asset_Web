


import 'package:asset_management/core/model/base_model.dart';

class ForgotAuth extends  BaseModel{
  int? id;
  String? email;
  String? token;
  String? expiration;
  String? createdAt;
  String? updatedAt;
  int? used;

  ForgotAuth(
      {this.id,
        this.email,
        this.token,
        this.expiration,
        this.createdAt,
        this.updatedAt,
        this.used});

  ForgotAuth fromJson(Map<String, dynamic> json) => ForgotAuth.fromJson(json);

  ForgotAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    token = json['token'];
    expiration = json['expiration'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    used = json['used'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['token'] = this.token;
    data['expiration'] = this.expiration;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['used'] = this.used;
    return data;
  }
}