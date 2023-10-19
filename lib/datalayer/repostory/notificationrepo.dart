import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/const/url.dart';

import '../model/get_notifications_model.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class NotificationRepo {
  static Future<NotificationModel> getNotificationRepo({token}) async {
    var response = await http.get(
      Uri.https(baseUrl, "/public/api/notifications"),
      headers: {'AUTHORIZATION': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = NotificationModel.fromJson(json);
      print(result.data!.notifications.length.toString());
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = NotificationModel.fromJson(json);
      return result;
    }
  }
}
