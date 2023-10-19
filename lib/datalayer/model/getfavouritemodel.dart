import 'package:untitled1/datalayer/model/productsmodel.dart';

class FavouriteModel {
  List<Data> data = [];
  String? status;
  String? message;

  FavouriteModel({required this.data, this.status, this.message});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? categoryId;
  int? id;
  String? title;
  String? description;
  String? code;
  var priceBeforeDiscount;
  var price;
  var discount;
  var amount;
  var isActive;
  bool? isFavorite;
  Unit? unit;
  List<Images>? images;
  String? mainImage;
  String? createdAt;

  Data(
      {this.categoryId,
      this.id,
      this.title,
      this.description,
      this.code,
      this.priceBeforeDiscount,
      this.price,
      this.discount,
      this.amount,
      this.isActive,
      this.isFavorite,
      this.unit,
      this.images,
      this.mainImage,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    code = json['code'];
    priceBeforeDiscount = json['price_before_discount'];
    price = json['price'];
    discount = json['discount'];
    amount = json['amount'];
    isActive = json['is_active'];
    isFavorite = json['is_favorite'];
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    mainImage = json['main_image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['code'] = this.code;
    data['price_before_discount'] = this.priceBeforeDiscount;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['amount'] = this.amount;
    data['is_active'] = this.isActive;
    data['is_favorite'] = this.isFavorite;
    if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['main_image'] = this.mainImage;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Unit {
  int? id;
  String? name;
  String? type;
  String? createdAt;
  String? updatedAt;

  Unit({this.id, this.name, this.type, this.createdAt, this.updatedAt});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
