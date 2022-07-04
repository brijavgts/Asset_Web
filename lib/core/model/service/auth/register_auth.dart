import '../../base_model.dart';

class RegisterAuth extends BaseModel {
  int? id;
  String? name;
  String? emailId;
  String? password;
  String? organizationName;
  String? hashedEmail;
  bool? status;
  bool? deleted;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? updatedBy;
  Null? deletedBy;

  RegisterAuth(
      {this.id,
        this.name,
        this.emailId,
        this.password,
        this.organizationName,
        this.hashedEmail,
        this.status,
        this.deleted,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.updatedBy,
        this.deletedBy});

  RegisterAuth fromJson(Map<String, dynamic> json) => RegisterAuth.fromJson(json);

  RegisterAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    emailId = json['emailId'];
    password = json['password'];
    organizationName = json['organizationName'];
    hashedEmail = json['hashedEmail'];
    status = json['status'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    updatedBy = json['updatedBy'];
    deletedBy = json['deletedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['emailId'] = this.emailId;
    data['password'] = this.password;
    data['organizationName'] = this.organizationName;
    data['hashedEmail'] = this.hashedEmail;
    data['status'] = this.status;
    data['deleted'] = this.deleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['updatedBy'] = this.updatedBy;
    data['deletedBy'] = this.deletedBy;
    return data;
  }
}