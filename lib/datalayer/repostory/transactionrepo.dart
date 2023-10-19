import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/transactionmodel.dart';

import '../model/walletmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class TransactionRepo {
  static Future<TransactionModel> getTransRepo({token}) async {
    var response = await http.get(
      Uri.https(baseUrl,"/public/api/wallet/get_wallet_transactions"),
      headers: {'AUTHORIZATION': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = TransactionModel.fromJson(json);
      print(result.status.toString());
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = TransactionModel.fromJson(json);
      return result;
    }
  }
}
