import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';

import '../model/loginmodel.dart';
import '../model/profilemodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ProfileRepo {
  static Future<ProfileModel> getProfileRepo({device_token}) async {
    var response = await http.get(
      Uri.https(baseUrl,profile),
      headers: {'AUTHORIZATION': 'Bearer $device_token'},
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ProfileModel.fromJson(json);
      print("=================${result.data.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ProfileModel.fromJson(json);
      print("=================profile error=================");
      return result;
    }
  }
}
