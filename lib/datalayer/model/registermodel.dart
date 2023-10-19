class RegisterModel {
  var status;
  var data;
  var message;
  var devMessage;

  RegisterModel({this.status, this.data, this.message, this.devMessage});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
    devMessage = json['dev_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['message'] = this.message;
    data['dev_message'] = this.devMessage;
    return data;
  }
}
