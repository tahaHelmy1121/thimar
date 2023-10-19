class LoginModel {
  Data? data;
  String? status;
  String? message;

  LoginModel({this.data, this.status, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? fullname;
  String? phone;
  String? email;
  String? image;
  int? isBan;
  bool? isActive;
  int? unreadNotifications;
  String? userType;
  String? token;
  Null? country;
  Null? city;
  Null? identityNumber;
  int? userCartCount;

  Data(
      {this.id,
      this.fullname,
      this.phone,
      this.email,
      this.image,
      this.isBan,
      this.isActive,
      this.unreadNotifications,
      this.userType,
      this.token,
      this.country,
      this.city,
      this.identityNumber,
      this.userCartCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    isBan = json['is_ban'];
    isActive = json['is_active'];
    unreadNotifications = json['unread_notifications'];
    userType = json['user_type'];
    token = json['token'];
    country = json['country'];
    //city = json['city'];
    identityNumber = json['identity_number'];
    userCartCount = json['user_cart_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    data['is_ban'] = this.isBan;
    data['is_active'] = this.isActive;
    data['unread_notifications'] = this.unreadNotifications;
    data['user_type'] = this.userType;
    data['token'] = this.token;
    data['country'] = this.country;
    data['city'] = this.city;
    data['identity_number'] = this.identityNumber;
    data['user_cart_count'] = this.userCartCount;
    return data;
  }
}
