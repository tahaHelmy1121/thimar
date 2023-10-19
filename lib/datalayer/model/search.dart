import 'package:untitled1/datalayer/model/productsmodel.dart';

class SearchModel {
  String? status;
  String? message;
  Data? data;

  SearchModel({this.status, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<SearchResult> searchResult = [];

  Data({required this.searchResult});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['search_result'] != null) {
      searchResult = <SearchResult>[];
      json['search_result'].forEach((v) {
        searchResult!.add(new SearchResult.fromJson(v));
      });
    }
  }
}

class SearchResult {
  var categoryId;
  var id;
  var title;
  var description;
  var code;
  var priceBeforeDiscount;
  var price;
  var discount;
  var amount;
  var isActive;
  var isFavorite;
  var unit;
  List<Images>? images;
  var mainImage;
  var createdAt;

  SearchResult(
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

  SearchResult.fromJson(Map<String, dynamic> json) {
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
