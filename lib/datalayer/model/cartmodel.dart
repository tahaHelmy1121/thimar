class CartModel {
  List<Data> data = [];
  var totalPriceBeforeDiscount;
  var totalDiscount;
  var totalPriceWithVat;
  var deliveryCost;
  var freeDeliveryPrice;
  var vat;
  var isVip;
  var vipDiscountPercentage;
  var minVipPrice;
  var vipMessage;
  var status;
  var message;

  CartModel(
      {required this.data,
      this.totalPriceBeforeDiscount,
      this.totalDiscount,
      this.totalPriceWithVat,
      this.deliveryCost,
      this.freeDeliveryPrice,
      this.vat,
      this.isVip,
      this.vipDiscountPercentage,
      this.minVipPrice,
      this.vipMessage,
      this.status,
      this.message});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    totalPriceBeforeDiscount = json['total_price_before_discount'];
    totalDiscount = json['total_discount'];
    totalPriceWithVat = json['total_price_with_vat'];
    deliveryCost = json['delivery_cost'];
    freeDeliveryPrice = json['free_delivery_price'];
    vat = json['vat'];
    isVip = json['is_vip'];
    vipDiscountPercentage = json['vip_discount_percentage'];
    minVipPrice = json['min_vip_price'];
    vipMessage = json['vip_message'];
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  Data({
    this.id,
    this.title,
    this.image,
    this.amount,
    this.priceBeforeDiscount,
    this.discount,
    this.price,
    this.remainingAmount,
  });

  var id;
  var title;
  var image;
  var amount;
  var priceBeforeDiscount;
  var discount;
  var price;
  var remainingAmount;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    amount = json['amount'];
    priceBeforeDiscount = json['price_before_discount'];
    discount = json['discount'];
    price = json['price'];
    remainingAmount = json['remaining_amount'];
  }
}
