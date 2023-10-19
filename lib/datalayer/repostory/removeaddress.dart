import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/color.dart';
import 'package:untitled1/const/url.dart';



import '../model/deletecartmodel.dart';
import '../model/removeaddress.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class RemoveAddressRepo {
  static Future<RemoveAdressModel> getRemoveAddressRepo({token, type,addresstemId}) async {
    Map<String,dynamic>body = {
      "type":type
    };
    var response = await http.delete(
      Uri.https(baseUrl,"/public/api/client/addresses/$addresstemId"),
      body: body,
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        "Accept-Language":"ar"
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RemoveAdressModel.fromJson(json);
      print("==============${result.message.toString()}============");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RemoveAdressModel.fromJson(json);
      return result;
    }
  }
}
