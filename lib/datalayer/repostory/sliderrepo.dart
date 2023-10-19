import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/slider.dart';
import '../model/categoriesmodel.dart';

dynamic toArabic({required Uint8List x}) {
  return jsonDecode(utf8.decode(x));
}

class SliderRepo {
  static Future<SliderModel> getSliderRepo({customer}) async {
    var response = await http.get(
      Uri.https(
        baseUrl,
        slider,
      ),

    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(x: response.bodyBytes);
      final result = SliderModel.fromJson(json);
      print(result.status);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(x: response.bodyBytes);
      final result = SliderModel.fromJson(json);
      return result;
    }
  }
}
