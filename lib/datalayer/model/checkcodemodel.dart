class CheckCodeModel {
  String? status;
  Null? data;
  String? message;
  bool? isActive;

  CheckCodeModel({this.status, this.data, this.message, this.isActive});

  CheckCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['message'] = this.message;
    data['is_active'] = this.isActive;
    return data;
  }
}
