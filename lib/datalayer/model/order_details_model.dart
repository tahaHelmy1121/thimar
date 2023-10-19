class OrderDetailsModel {
  OrderDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  late final String status;
  late final String message;
  late final Data data;

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
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
    this.phone,
    this.address,
    required this.products,
    required this.payType,
    required this.note,
    required this.deliveryPayer,
    required this.isVip,
    required this.vipDiscount,
    required this.priceBeforeDiscount,
    required this.discount,
  });

  late final int id;
  late final String status;
  late final String date;
  late final String time;
  late final dynamic orderPrice;
  late final int deliveryPrice;
  late final double totalPrice;
  late final String clientName;
  late final void phone;
  late final dynamic address;
  late final List<Products> products;
  late final String payType;
  late final String note;
  late final String deliveryPayer;
  late final int isVip;
  late final dynamic vipDiscount;
  late final dynamic priceBeforeDiscount;
  late final dynamic discount;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    date = json['date'];
    time = json['time'];
    orderPrice = json['order_price'];
    deliveryPrice = json['delivery_price'];
    totalPrice = json['total_price'];
    clientName = json['client_name'];
    phone = null;
    address = json['address']["description"];
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    payType = json['pay_type'];
    note = json['note'];
    deliveryPayer = json['delivery_payer'];
    isVip = json['is_vip'];
    vipDiscount = json['vip_discount'];
    priceBeforeDiscount = json['price_before_discount'];
    discount = json['discount'];
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
