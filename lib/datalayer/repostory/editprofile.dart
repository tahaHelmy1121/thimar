import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/profilemodel.dart';

import '../model/loginmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class EditProfileRepo {
  static Future<ProfileModel>  getPersonalRepo({
    name,
   phone,
    city,
    password,
    device_token,
  //  confirmation_pass
//   File? image,
  }) async {
    Map<String, dynamic> body = {
      "fullname": name,
      "phone": phone,
      "city_id": city,
      "password": password,
 //     "password_confirmation":confirmation_pass,
 //    "image": image
    };

    var response = await http.post(
      Uri.parse("https://thimar.amr.aait-d.com/public/api/client/profile"),
      headers: {'AUTHORIZATION': 'Bearer $device_token'},
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ProfileModel.fromJson(json);
      print(
          "=================${result.message.toString()}=================");
      return result;
    } else {
      print("erro edit");
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);

      final result = ProfileModel.fromJson(json);
      return result;
    }
  }
}
