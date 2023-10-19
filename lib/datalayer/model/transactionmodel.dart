class TransactionModel {
  List<Data> data = [];
  Links? links;
  Meta? meta;
  var status;
  var message;

  TransactionModel(
      {required this.data, this.links, this.meta, this.status, this.message});

  TransactionModel.fromJson(Map<String, dynamic> json) {
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

class Links {
  var first;
  var last;
  var prev;
  var next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
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

