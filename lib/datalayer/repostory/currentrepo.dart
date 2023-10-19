import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/aboutmodel.dart';
import 'package:untitled1/datalayer/model/slider.dart';
import '../model/categoriesmodel.dart';
import '../model/current_order_model.dart';

dynamic toArabic({required Uint8List x}) {
  return jsonDecode(utf8.decode(x));
}

class CurrentOrderRepo {
  static Future<CurrentOrderModel> getOrderRepo({customer}) async {
    var response = await http.get(
      Uri.https(
        baseUrl,
        "/public/api/client/orders/current",
      ),
      headers: {'AUTHORIZATION': 'Bearer $customer'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(x: response.bodyBytes);
      final result = CurrentOrderModel.fromJson(json);
      print("dataaaaaaaaaaaaaaaaaaa");
      print(result.status);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(x: response.bodyBytes);
      final result = CurrentOrderModel.fromJson(json);
      print("nulllllllllllllll");
      return result;
    }
  }
}
