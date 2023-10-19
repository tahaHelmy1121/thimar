import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/forgetmodel.dart';
import 'package:untitled1/datalayer/model/resendcode.dart';

import '../model/loginmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ResendCodeRepo {
  static Future<ResendCode> getCodeRepo({var phone,code}) async {
    Map<String, dynamic> body = {
      "phone": phone.toString(),
      "code":"1111",
    };

    var response = await http.post(
      Uri.parse("https://thimar.amr.aait-d.com/public/api/resend_code"),
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ResendCode.fromJson(json);
      print("=================${result.data.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ResendCode.fromJson(json);
      return result;
    }
  }
}
