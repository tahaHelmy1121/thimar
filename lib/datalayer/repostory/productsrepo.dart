


import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart'as http;
import 'package:untitled1/const/url.dart';
import '../model/categoriesmodel.dart';
import '../model/productsmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class  ProductsRepo {
  static Future<ProductsModel> getProductsRepo({id}) async {
    var response = await http
        .get(Uri.https(baseUrl,products),

    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ProductsModel.fromJson(json);
      print("////////////////////result.data/////////////");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ProductsModel.fromJson(json);
      return result;
    }
  }
}