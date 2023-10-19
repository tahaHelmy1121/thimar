class AddAdressModel {
  String? status;
  String? message;
  Data? data;

  AddAdressModel({this.status, this.message, this.data});

  AddAdressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? type;
  double? lat;
  double? lng;
  String? location;
  String? description;
  bool? isDefault;
  String? phone;

  Data(
      {this.id,
        this.type,
        this.lat,
        this.lng,
        this.location,
        this.description,
        this.isDefault,
        this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
    description = json['description'];
    isDefault = json['is_default'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['location'] = this.location;
    data['description'] = this.description;
    data['is_default'] = this.isDefault;
    data['phone'] = this.phone;
    return data;
  }
}