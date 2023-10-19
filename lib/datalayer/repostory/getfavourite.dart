import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/cartmodel.dart';
import 'package:untitled1/datalayer/model/getfavouritemodel.dart';

import '../model/loginmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class FavouriteRepo {
  static Future<FavouriteModel> getFavRepo({token}) async {
    var response = await http.get(
      Uri.https(baseUrl,"/public/api/client/products/favorites"),
      headers: {'AUTHORIZATION': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = FavouriteModel.fromJson(json);
      print(result.data.length.toString());
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = FavouriteModel.fromJson(json);
      return result;
    }
  }
}
