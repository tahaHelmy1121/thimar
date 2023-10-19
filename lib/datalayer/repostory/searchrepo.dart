import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/search.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class SearchRepo {
  static Future<SearchModel> getSearchRepo(
      {keyword, filter, min_price, max_price}) async {
    final queryParameters = {
      'keyword': keyword.toString(),
      'filter': filter.toString(),
      'min_price': min_price.toString(),
      'max_price': max_price.toString(),
    };
    var response = await http.get(
      Uri.parse("https://thimar.amr.aait-d.com/public/api/search/?keyword=$keyword&filter=asc&min_price=5&max_price=100000"),
      headers:  {
        "accept":"application/json"
      }
    );

    if (response.statusCode == 200) {
      Map<String,dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SearchModel.fromJson(json);
      print("@#&^#@%^&%#&^%^searchData@&%@#&@#&#@&@#%&@");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SearchModel.fromJson(json);
      print("@#&^#@%^&%#&^%^Error@&%@#&@#&#@&@#%&@");
      return result;
    }
  }
}
