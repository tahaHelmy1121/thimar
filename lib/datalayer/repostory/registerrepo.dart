import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/url.dart';

import '../model/registermodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class RegisterRepo {
  static Future<RegisterModel> getRegisterRepo(
      {var fullName, password, phone, gender, password_confirmation,lat,lang}) async {
    Map<String, dynamic> body = {
      "fullname": fullName.toString(),
      "password": password.toString(),
      "phone": phone.toString(),
      "gender": gender.toString(),
      "password_confirmation": password_confirmation.toString(),
      "lat": lat.toString(),
      "lang": lang.toString(),
    };

    var response = await http.post(
      Uri.https(baseUrl,register),
      //  headers: {'AUTHORIZATION': 'Bearer $device_token'},
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RegisterModel.fromJson(json);
      print(result.message.toString());
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RegisterModel.fromJson(json);
      return result;
    }
  }
}
