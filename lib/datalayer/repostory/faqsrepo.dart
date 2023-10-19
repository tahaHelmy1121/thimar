


import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart'as http;
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/slider.dart';
import '../model/categoriesmodel.dart';
import '../model/faqsmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class FaqsRepo {
  static Future<FaqsModel> getFaqsRepo({customer}) async {
    var response = await http
        .get(Uri.https(baseUrl,faqs),
      headers: {
          "Accept-Language":"ar"
      }

    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = FaqsModel.fromJson(json);
      print(result.message);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = FaqsModel.fromJson(json);
      return result;
    }
  }
}