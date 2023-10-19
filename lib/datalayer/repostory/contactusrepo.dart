
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/cotactusmodel.dart';
import 'package:untitled1/datalayer/model/profilemodel.dart';

import '../model/loginmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ContactUsRepoRepo {
  static Future<ContactUsModel> CreateContactRepo({
    fullname,
    phone,
    title,
    content,
    //  confirmation_pass
//   File? image,
  }) async {
    Map<String, dynamic> body = {
      "fullname": fullname.toString(),
      "phone": phone.toString(),
      "content":content.toString(),
   //   "title":"test"
    };

    var response = await http.post(
      Uri.http(baseUrl,"/public/api/contact"),
   //   headers: {'AUTHORIZATION': 'Bearer $device_token'},
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ContactUsModel.fromJson(json);
      print(
          "=================${result.message!.toString()}=================");
      return result;
    } else {
      print("erro edit");
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);

      final result = ContactUsModel.fromJson(json);
      return result;
    }
  }





}

