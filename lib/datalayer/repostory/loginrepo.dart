import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';

import '../model/loginmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class LoginRepo {
  static Future<LoginModel> getLoginRepo(
      {var phone, password, device_token, type, user_type,}) async {
    Map<String, dynamic> body = {
      "phone": phone.toString(),
      "password": password.toString(),
      "device_token": device_token.toString(),
      "type": type.toString(),
      "user_type": user_type.toString()
    };

    var response = await http.post(
      Uri.https(baseUrl,login),
      headers: {'AUTHORIZATION': 'Bearer $device_token'},
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = LoginModel.fromJson(json);
      print("=================${result.data?.token.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = LoginModel.fromJson(json);
      return result;
    }
  }
}
