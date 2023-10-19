class WalletModel {
  List<Data> data = [];
  List<Images> image = [];
  String? status;
  String? message;
 var wallet;

  WalletModel({required this.data, this.status, this.message, this.wallet});

  WalletModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    data['wallet'] = this.wallet;
    return data;
  }
}

class Data {
  var id;
  var amount;
  var beforeCharge;
  var afterCharge;
  var date;
  var statusTrans;
  var status;
  var transactionType;
  var modelType;
  var modelId;
  var state;

  Data(
      {this.id,
      this.amount,
      this.beforeCharge,
      this.afterCharge,
      this.date,
      this.statusTrans,
      this.status,
      this.transactionType,
      this.modelType,
      this.modelId,
      this.state});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    beforeCharge = json['before_charge'];
    afterCharge = json['after_charge'];
    date = json['date'];
    statusTrans = json['status_trans'];
    status = json['status'];
    transactionType = json['transaction_type'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['before_charge'] = this.beforeCharge;
    data['after_charge'] = this.afterCharge;
    data['date'] = this.date;
    data['status_trans'] = this.statusTrans;
    data['status'] = this.status;
    data['transaction_type'] = this.transactionType;
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['state'] = this.state;
    return data;
  }
}

class Images {
  var name;
var url;

  Images({this.name, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
