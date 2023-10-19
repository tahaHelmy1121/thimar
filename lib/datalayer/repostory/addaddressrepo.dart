import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/url.dart';

import '../model/add_address_model.dart';
import '../model/registermodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class AddAddressRepo {
  static Future<AddAdressModel> getRegisterRepo(
      {type, phone , desc , lat , lng , token , loc , isDefault}) async {
    Map<String, dynamic> body = {
      "type":  "work".toString(),
      "phone":phone.toString(),
      "description": desc.toString(),
      "location":  loc.toString(),
      "lat":  lat.toString(),
      "lng":  lng.toString(),
      "is_default": 1.toString(),
    };

    var response = await http.post(
      Uri.https(baseUrl,"/public/api/client/addresses"),
      headers: {'AUTHORIZATION': 'Bearer $token'},
      body:body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = AddAdressModel.fromJson(json);
      print(result.message.toString());
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = AddAdressModel.fromJson(json);
      return result;
    }
  }
}
