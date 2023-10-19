import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/forgetmodel.dart';

import '../model/loginmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ForgetRepo {
  static Future<ForgetPasswordModel> getForgetRepo({var phone}) async {
    Map<String, dynamic> body = {
      "phone": phone.toString(),
    };

    var response = await http.post(
      Uri.parse("https://thimar.amr.aait-d.com/public/api/forget_password"),
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ForgetPasswordModel.fromJson(json);
      print("=================${result.data.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ForgetPasswordModel.fromJson(json);
      return result;
    }
  }
}
