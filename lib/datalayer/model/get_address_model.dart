class GetAddressModel {
  GetAddressModel({
    required this.data,
  });
 List<Data> data = [];

  GetAddressModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }
}

class Data {
  Data({
    required this.id,
    required this.type,
    required this.lat,
    required this.lng,
    required this.location,
    required this.description,
    required this.isDefault,
    required this.phone,
  });
  var id;
  var type;
  var lat;
  var lng;
  var location;
  var description;
  var isDefault;
  var phone;

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
}
