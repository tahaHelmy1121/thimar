class CurrentOrderModel {
  CurrentOrderModel({
    required this.data,
     this.links,
     this.status,
     this.message,
  });

  late final List<Data> data;
  var links;
  var status;
  var message;

  CurrentOrderModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
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
    required this.note,
    required this.isVip,
    required this.vipDiscountPercentage,
  });

var id;
  var status;
 var date;
var time;
 var orderPrice;
  var deliveryPrice;
  var totalPrice;
 var clientName;
  var phone;
  var location;
  var deliveryPayer;
  late final List<Products> products;
 var payType;
 var note;
var isVip;
var vipDiscountPercentage;

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
    note = json['note'];
    isVip = json['is_vip'];
    vipDiscountPercentage = json['vip_discount_percentage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['date'] = date;
    data['time'] = time;
    data['order_price'] = orderPrice;
    data['delivery_price'] = deliveryPrice;
    data['total_price'] = totalPrice;
    data['client_name'] = clientName;
    data['phone'] = phone;
    data['location'] = location;
    data['delivery_payer'] = deliveryPayer;
    data['products'] = products.map((e) => e.toJson()).toList();
    data['pay_type'] = payType;
    data['note'] = note;
    data['is_vip'] = isVip;
    data['vip_discount_percentage'] = vipDiscountPercentage;
    return data;
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
  }
}
