import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';

import '../model/loginmodel.dart';
import '../model/walletmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ChargeRepo {
  static Future<WalletModel> getChrageRepo(
      {var amount, transaction_id , token }) async {
    Map<String, dynamic> body = {
      "amount": amount,
      "transaction_id": transaction_id,
 //     "device_token": token.toString(),

    };

    var response = await http.post(
      Uri.https(baseUrl,"/public/api/wallet/charge"),
      headers: {'AUTHORIZATION': 'Bearer $token' },
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = WalletModel.fromJson(json);
      print("=================${result.data.first.modelType.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = WalletModel.fromJson(json);
      return result;
    }
  }
}
