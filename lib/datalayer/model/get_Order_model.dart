class GetClientOrderModel {
  GetClientOrderModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
    required this.message,
  });

  late final List<Data> data;
  late final Links links;
  late final Meta meta;
  late final String status;
  late final String message;

  GetClientOrderModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data'] ?? '').map((e) => Data.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  Data({
    required this.id,
    required this.status,
    required this.date,
    required this.time,
    required this.orderPrice,
    required this.deliveryPrice,
    required this.totalPrice,
    required this.clientName,
    required this.phone,
    required this.location,
    required this.deliveryPayer,
    required this.products,
    required this.payType,
    this.note,
    required this.isVip,
    required this.vipDiscountPercentage,
  });

  late final int id;
  late final String status;
  late final String date;
  late final String time;
  late final double? orderPrice;
  late final int deliveryPrice;
  late final double? totalPrice;
  late final String clientName;
  late final String phone;
  late final String location;
  late final String deliveryPayer;
  late final List<Products> products;
  late final String payType;
  late final String? note;
  late final int isVip;
  late final int vipDiscountPercentage;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    date = json['date'];
    time = json['time'];
    orderPrice = json['order_price'];
    deliveryPrice = json['delivery_price'];
    totalPrice = json['total_price'];
    clientName = json['client_name'];
    phone = json['phone'];
    location = json['location'];
    deliveryPayer = json['delivery_payer'];
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    payType = json['pay_type'];
    note = json[''];
    isVip = json['is_vip'];
    vipDiscountPercentage = json['vip_discount_percentage'];
  }
}

class Products {
  Products({
    required this.name,
    required this.url,
  });

  late final String name;
  late final String url;

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class Links {
  Links({
    required this.first,
    required this.last,
    this.prev,
    required this.next,
  });

  late final String first;
  late final String last;
  late final void prev;
  late final String next;

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json[''];
    next = json['next'];
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

  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

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
