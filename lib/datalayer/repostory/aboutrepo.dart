import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/aboutmodel.dart';
import 'package:untitled1/datalayer/model/slider.dart';
import '../model/categoriesmodel.dart';

dynamic toArabic({required Uint8List x}) {
  return jsonDecode(utf8.decode(x));
}

class AboutRepo {
  static Future<AboutModel> getAboutRepo({customer}) async {
    var response = await http.get(
      Uri.https(
        baseUrl,
        about,
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(x: response.bodyBytes);
      final result = AboutModel.fromJson(json);
      print(result.status);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(x: response.bodyBytes);
      final result = AboutModel.fromJson(json);
      return result;
    }
  }
}
