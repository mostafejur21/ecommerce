class UserReadProfileModel {
  String? msg;
  Data? data;

  UserReadProfileModel({this.msg, this.data});

  UserReadProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? cusName;
  String? cusAdd;
  String? cusCity;
  String? cusState;
  String? cusPostcode;
  String? cusCountry;
  String? cusPhone;
  String? cusFax;
  String? shipName;
  String? shipAdd;
  String? shipCity;
  String? shipState;
  String? shipPostcode;
  String? shipCountry;
  String? shipPhone;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Data(
      {this.id,
        this.cusName,
        this.cusAdd,
        this.cusCity,
        this.cusState,
        this.cusPostcode,
        this.cusCountry,
        this.cusPhone,
        this.cusFax,
        this.shipName,
        this.shipAdd,
        this.shipCity,
        this.shipState,
        this.shipPostcode,
        this.shipCountry,
        this.shipPhone,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
    cusAdd = json['cus_add'];
    cusCity = json['cus_city'];
    cusState = json['cus_state'];
    cusPostcode = json['cus_postcode'];
    cusCountry = json['cus_country'];
    cusPhone = json['cus_phone'];
    cusFax = json['cus_fax'];
    shipName = json['ship_name'];
    shipAdd = json['ship_add'];
    shipCity = json['ship_city'];
    shipState = json['ship_state'];
    shipPostcode = json['ship_postcode'];
    shipCountry = json['ship_country'];
    shipPhone = json['ship_phone'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cus_name'] = cusName;
    data['cus_add'] = cusAdd;
    data['cus_city'] = cusCity;
    data['cus_state'] = cusState;
    data['cus_postcode'] = cusPostcode;
    data['cus_country'] = cusCountry;
    data['cus_phone'] = cusPhone;
    data['cus_fax'] = cusFax;
    data['ship_name'] = shipName;
    data['ship_add'] = shipAdd;
    data['ship_city'] = shipCity;
    data['ship_state'] = shipState;
    data['ship_postcode'] = shipPostcode;
    data['ship_country'] = shipCountry;
    data['ship_phone'] = shipPhone;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? otp;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.email, this.otp, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['otp'] = otp;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
