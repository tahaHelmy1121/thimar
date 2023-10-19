import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';

import '../model/loginmodel.dart';
import '../model/resetmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ResetRepo {
  static Future<ResetCodeModel> getResetRepo(
      {var phone, password,code}) async {
    Map<String, dynamic> body = {
      "phone": phone.toString(),
      "password": password.toString(),
     "code":"1111",
    };

    var response = await http.post(
      Uri.https(baseUrl,"/public/api/reset_password"),
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ResetCodeModel.fromJson(json);
      print("=================${result.message?.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ResetCodeModel.fromJson(json);
      return result;
    }
  }
}
