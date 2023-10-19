import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/color.dart';
import 'package:untitled1/const/url.dart';
import '../model/addtocart.dart';
import '../model/cartmodel.dart';
import '../model/categoriesmodel.dart';
import '../model/deletecartmodel.dart';
import '../model/removefavmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class RemoveFavRepo {
  static Future<RemoveFavouriteModel> getRemoveFavRepo(
      {token, id, index}) async {
    var response = await http.post(
      Uri.http("thimar.amr.aait-d.com",
          "/public/api/client/products/$id/remove_from_favorite"),
      headers: {'AUTHORIZATION': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      print("on");
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RemoveFavouriteModel.fromJson(json);
      print("==============${result.message.toString()}============");
      return result;
    } else {
      print("of");
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RemoveFavouriteModel.fromJson(json);
      return result;
    }
  }
}
