import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/color.dart';
import 'package:untitled1/const/url.dart';
import '../model/add_favourite_model.dart';
import '../model/addtocart.dart';
import '../model/cartmodel.dart';
import '../model/categoriesmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class AddToFavRepo {
  static Future<AddFavouriteModel> getAddFavRepo(
      {product_id,  token, index}) async {
    var response = await http.post(
      Uri.https(
          baseUrl,"/public/api/client/products/$product_id/add_to_favorite"),
      headers: {'AUTHORIZATION': 'Bearer $token', "Accept-Language": "ar"},
    );

    if (response.statusCode == 200) {
      print("==============fav suc============");
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = AddFavouriteModel.fromJson(json);
      print("==============${result.status.toString()}============");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = AddFavouriteModel.fromJson(json);
      return result;
    }
  }
}
