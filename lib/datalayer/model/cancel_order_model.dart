class CancelOrderModel {
  CancelOrderModel({
    required this.status,
    required this.message,
  });

  late final String status;
  late final String message;

  CancelOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
