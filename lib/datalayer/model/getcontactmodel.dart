class ContactModel {
  Data? data;
  String? status;
  String? message;

  ContactModel({this.data, this.status, this.message});

  ContactModel.fromJson(Map<String, dynamic> json) {
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
  String? phone;
  String? email;
  String? whatsapp;
  Social? social;
  double? lat;
  double? lng;
  String? location;

  Data(
      {this.phone,
        this.email,
        this.whatsapp,
        this.social,
        this.lat,
        this.lng,
        this.location});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    social =
    json['social'] != null ? new Social.fromJson(json['social']) : null;
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['whatsapp'] = this.whatsapp;
    if (this.social != null) {
      data['social'] = this.social!.toJson();
    }
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['location'] = this.location;
    return data;
  }
}

class Social {
  String? facebook;
  String? twitter;
  String? instagram;

  Social({this.facebook, this.twitter, this.instagram});

  Social.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    return data;
  }
}
