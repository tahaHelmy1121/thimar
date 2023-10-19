


import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart'as http;
import 'package:untitled1/const/url.dart';
import '../model/categoriesmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class Category {
  static Future<CategoriesModel> getCategoryRepo() async {
    var response = await http
        .get(Uri.https(baseUrl,category),

    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = CategoriesModel.fromJson(json);
      print(result.data.length);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = CategoriesModel.fromJson(json);
      return result;
    }
  }
}