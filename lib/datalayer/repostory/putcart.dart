    import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/color.dart';
import 'package:untitled1/const/url.dart';
import '../model/addtocart.dart';
import '../model/cartmodel.dart';
import '../model/categoriesmodel.dart';
import '../model/putquantitycart.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class PutToCartRepo {
  static Future<PutCartModel> getChangeCartRepo({product_id, amount,token,index}) async {
    Map<String, dynamic> putCartItem = {
      "amount": amount.toString(),
    };
    var response = await http.put(
      Uri.https(baseUrl,"/public/api/client/cart/$amount"),
      headers: {'AUTHORIZATION': 'Bearer $token'},
      body: putCartItem,
    );


    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = PutCartModel.fromJson(json);
      print("===========UAIHSIHSIHSIAH===${result.message.toString()}======&&^^&T%%%===&*Y(&*&IHGHG===");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = PutCartModel.fromJson(json);
      return result;
    }
  }
}
