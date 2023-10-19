class AddToCartModel {
  String? status;
  String? message;
  Data? data;

  AddToCartModel({this.status, this.message, this.data});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
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
  var title;
  var image;
  var amount;
  var deliveryCost;
  var price;

  Data({this.title, this.image, this.amount, this.deliveryCost, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    amount = json['amount'];
    deliveryCost = json['delivery_cost'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['amount'] = this.amount;
    data['delivery_cost'] = this.deliveryCost;
    data['price'] = this.price;
    return data;
  }
}
