class ConfirmOrderModel {
  ConfirmOrderModel({
     this.status,
     this.message,
    this.data,
  });

  var status;
 var message;
var data;

  ConfirmOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
}
