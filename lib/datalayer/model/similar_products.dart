class SimilarProductsModel {
  SimilarProductsModel({
    required this.data,
  });

  late final List<Data> data;

  SimilarProductsModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data'] ?? []).map((e) => Data.fromJson(e)).toList();
  }
}

class Data {
  Data({
    required this.categoryId,
    required this.id,
    required this.title,
    required this.description,
    required this.code,
    required this.priceBeforeDiscount,
    required this.price,
    required this.discount,
    required this.amount,
    required this.isActive,
    required this.isFavorite,
    required this.unit,
    required this.images,
    required this.mainImage,
    required this.createdAt,
  });

  late final num categoryId;
  late final num id;
  late final String title;
  late final String description;
  late final String code;
  late final num priceBeforeDiscount;
  late final num price;
  late final num discount;
  late final num amount;
  late final num isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

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
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    mainImage = json['main_image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['code'] = code;
    data['price_before_discount'] = priceBeforeDiscount;
    data['price'] = price;
    data['discount'] = discount;
    data['amount'] = amount;
    data['is_active'] = isActive;
    data['is_favorite'] = isFavorite;
    data['unit'] = unit.toJson();
    data['images'] = images.map((e) => e.toJson()).toList();
    data['main_image'] = mainImage;
    data['created_at'] = createdAt;
    return data;
  }
}

class Unit {
  Unit({
    required this.id,
    required this.name,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  late final num id;
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Images {
  Images({
    required this.name,
    required this.url,
  });

  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Links {
  Links({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  late final String first;
  late final String last;
  late final void prev;
  late final void next;

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = null;
    next = null;
  }
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  late final num currentPage;
  late final num from;
  late final num lastPage;
  late final List<Links> links;
  late final String path;
  late final num perPage;
  late final num to;
  late final num total;

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}
