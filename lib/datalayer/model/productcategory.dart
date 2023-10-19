class CategoryProduct {
  List<Data> data = [];
  var links;
  var meta;
  var status;
var message;
 var userCartCount;
var maxPrice;
var minPrice;

  CategoryProduct(
      {required this.data,
        this.links,
        this.meta,
        this.status,
        this.message,
        this.userCartCount,
        this.maxPrice,
        this.minPrice});

  CategoryProduct.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    status = json['status'];
    message = json['message'];
    userCartCount = json['user_cart_count'];
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    data['user_cart_count'] = this.userCartCount;
    data['max_price'] = this.maxPrice;
    data['min_price'] = this.minPrice;
    return data;
  }
}

class Data {
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
  Unit? unit;
  List<Images>? images;
  var mainImage;
  var createdAt;

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

class Images {
  String? name;
  String? url;

  Images({this.name, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}



class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}