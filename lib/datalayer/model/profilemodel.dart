class ProfileModel {
  Data? data;
  var status;
  var message;

  ProfileModel({this.data, this.status, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  var id;
  var fullname;
  var phone;
  var image;
  City? city;
  var isVip;

  Data({this.id, this.fullname, this.phone, this.image, this.city, this.isVip});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    phone = json['phone'];
    image = json['image'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    isVip = json['is_vip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['phone'] = this.phone;
    data['image'] = this.image;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['is_vip'] = this.isVip;
    return data;
  }
}

class City {
  var id;
  var name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
