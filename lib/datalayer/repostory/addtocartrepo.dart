import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/color.dart';
import 'package:untitled1/const/url.dart';
import '../model/addtocart.dart';
import '../model/cartmodel.dart';
import '../model/categoriesmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class AddToCartRepo {
  static Future<AddToCartModel> getAddCartRepo({product_id, amount,token,index}) async {
    Map<String, dynamic> addCart = {
      "product_id": product_id.toString(),
      "amount": amount.toString(),
    };
    var response = await http.post(
      Uri.https(baseUrl,cart),
      headers: {'AUTHORIZATION': 'Bearer $token'},
      body: addCart,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = AddToCartModel.fromJson(json);
      print("==============${result.status.toString()}============");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = AddToCartModel.fromJson(json);
      return result;
    }
  }
}
