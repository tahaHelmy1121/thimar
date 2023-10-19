import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/url.dart';
import '../model/policy_model.dart';
dynamic toArabic({required Uint8List x}) {
  return jsonDecode(utf8.decode(x));
}

class policyRepo {
  static Future<PolicyModel> getPolicyRepo() async {
    var response = await http.get(
      Uri.https(
        baseUrl,
        "/public/api/policy",
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(x: response.bodyBytes);
      final result = PolicyModel.fromJson(json);
      print(result.status);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(x: response.bodyBytes);
      final result = PolicyModel.fromJson(json);
      return result;
    }
  }
}
