import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/forgetmodel.dart';
import 'package:untitled1/presntionlayer/auth/verifycode.dart';

import '../model/loginmodel.dart';
import '../model/verifycodemodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class VerifyCodeRepo {
  static Future<verifyCodeModel> getConfaimationRepo({var phone,code ,type,token,context}) async {
    Map<String, dynamic> body = {
      "code": "1111",
      "phone":phone.toString(),
     "device_token":"test",
      "type":"ios",

    };

    var response = await http.post(
      Uri.https(baseUrl,"/public/api/verify"),
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = verifyCodeModel.fromJson(json);
      print("=================${result.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = verifyCodeModel.fromJson(json);
      print("=================${result.message.toString()}=================");
      return result;
    }
  }
}
