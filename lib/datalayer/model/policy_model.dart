class PolicyModel {
  PolicyModel({
     this.data,
     this.status,
     this.message,
  });

 Data? data;
 var status;
  var message;

  PolicyModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  Data({
    required this.policy,
  });

  late final String policy;

  Data.fromJson(Map<String, dynamic> json) {
    policy = json['policy'];
  }
}
