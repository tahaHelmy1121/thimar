class ResendCode {
  String? status;
  Null? data;
  String? message;
  bool? isActive;
  int? devMessage;

  ResendCode(
      {this.status, this.data, this.message, this.isActive, this.devMessage});

  ResendCode.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
    isActive = json['is_active'];
    devMessage = json['dev_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['message'] = this.message;
    data['is_active'] = this.isActive;
    data['dev_message'] = this.devMessage;
    return data;
  }
}
