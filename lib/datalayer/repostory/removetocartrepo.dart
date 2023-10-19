import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/color.dart';
import 'package:untitled1/const/url.dart';
import '../model/addtocart.dart';
import '../model/cartmodel.dart';
import '../model/categoriesmodel.dart';
import '../model/deletecartmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class RemoveCartRepo {
  static Future<DeleteCartModel> getRemoveCartRepo({token, index,cartItemId}) async {
    var response = await http.delete(
      Uri.https(baseUrl,"/public/api/client/cart/delete_item/$cartItemId"),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        "Accept-Language":"ar"
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = DeleteCartModel.fromJson(json);
      print("==============${result.message.toString()}============");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = DeleteCartModel.fromJson(json);
      return result;
    }
  }
}
