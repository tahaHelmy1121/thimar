import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/url.dart';
import '../model/confirm_order_model.dart';


dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class AddOrderRepo {
  static Future<ConfirmOrderModel> orderRepo(
      {token,address_id,date,time,note,pay_type,transaction_id,coupon_code,city_id , id}) async {
    Map<String, dynamic> body = {
      "address_id":address_id.toString(),
      "date":date.toString(),
      "time":time.toString(),
     "note":note.toString(),
      "pay_type":"wallet",
      "transaction_id":"123".toString(),
      "coupon_code":"blender2".toString(),
      "city_id":"12".toString(),
    };

    var response = await http.post(
      Uri.https(baseUrl,"/public/api/client/orders"),
      headers: {'AUTHORIZATION': 'Bearer $token'},
      body:body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ConfirmOrderModel.fromJson(json);
      print(result.message.toString());
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ConfirmOrderModel.fromJson(json);
      return result;
    }
  }
}
