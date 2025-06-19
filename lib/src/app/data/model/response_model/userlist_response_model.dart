import 'dart:convert';

UserListResponseModel commonDropDownModelFromJson(String str) =>
    UserListResponseModel.fromJson(json.decode(str));

String commonDropDownModelToJson(UserListResponseModel data) =>
    json.encode(data.toJson());

class UserListResponseModel {
  int? page;
  int? perPage;
  int? totalrecord;
  int? totalPages;
  List<UserListData>? data;

  UserListResponseModel(
      {this.page, this.perPage, this.totalrecord, this.totalPages, this.data});

  UserListResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    totalrecord = json['totalrecord'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <UserListData>[];
      json['data'].forEach((v) {
        data!.add(UserListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['totalrecord'] = this.totalrecord;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserListData {
  int? id;
  String? name;
  String? email;
  String? profilepicture;
  String? location;
  String? createdat;

  UserListData(
      {this.id,
      this.name,
      this.email,
      this.profilepicture,
      this.location,
      this.createdat});

  UserListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilepicture = json['profilepicture'];
    location = json['location'];
    createdat = json['createdat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profilepicture'] = this.profilepicture;
    data['location'] = this.location;
    data['createdat'] = this.createdat;
    return data;
  }
}
