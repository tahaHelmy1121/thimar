import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart'as http;
import '../../const/url.dart';
import '../model/getcontactmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ContactRepo {
  static Future<ContactModel> getContactRepo({customer}) async {
    var response = await http
        .get(Uri.https(baseUrl,"/public/api/contact"),
        headers: {
          "Accept-Language":"ar"
        }

    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ContactModel.fromJson(json);
      print(result.message);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ContactModel.fromJson(json);
      return result;
    }
  }
}