import 'package:asset_management/core/model/base_model.dart';

class ChangeAuth extends BaseModel {
  int? id;
  Null? empId;
  String? firstName;
  Null? lastName;
  Null? gender;
  Null? bloodGroup;
  Null? phoneNumber;
  Null? address;
  Null? city;
  Null? state;
  String? emailId;
  Null? alternatePhoneNumber;
  String? password;
  Null? departmentId;
  Null? roleId;
  int? organizationId;
  Null? locationId;
  Null? image;
  bool? status;
  bool? deleted;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? createdBy;
  Null? updatedBy;
  Null? deletedBy;

  ChangeAuth(
      {this.id,
        this.empId,
        this.firstName,
        this.lastName,
        this.gender,
        this.bloodGroup,
        this.phoneNumber,
        this.address,
        this.city,
        this.state,
        this.emailId,
        this.alternatePhoneNumber,
        this.password,
        this.departmentId,
        this.roleId,
        this.organizationId,
        this.locationId,
        this.image,
        this.status,
        this.deleted,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdBy,
        this.updatedBy,
        this.deletedBy});

  ChangeAuth fromJson(Map<String, dynamic> json) => ChangeAuth.fromJson(json);

  ChangeAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    empId = json['empId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    bloodGroup = json['bloodGroup'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    emailId = json['emailId'];
    alternatePhoneNumber = json['alternatePhoneNumber'];
    password = json['password'];
    departmentId = json['departmentId'];
    roleId = json['roleId'];
    organizationId = json['organizationId'];
    locationId = json['locationId'];
    image = json['image'];
    status = json['status'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    deletedBy = json['deletedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['empId'] = this.empId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['bloodGroup'] = this.bloodGroup;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['emailId'] = this.emailId;
    data['alternatePhoneNumber'] = this.alternatePhoneNumber;
    data['password'] = this.password;
    data['departmentId'] = this.departmentId;
    data['roleId'] = this.roleId;
    data['organizationId'] = this.organizationId;
    data['locationId'] = this.locationId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['deleted'] = this.deleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['deletedBy'] = this.deletedBy;
    return data;
  }
}