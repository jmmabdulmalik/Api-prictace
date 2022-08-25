import 'dart:convert';
import 'dart:io';
import 'package:api_task/model/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../cont.dart';

class AppRepo {
  static int pages = 1;

  static Future<int> fetchData() async {
    try {
      String uri = 'https://reqres.in/api/users?page=$pages';
      final response = await http.get(Uri.parse(uri));
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Controller.appModel = AppModel.fromJson(data);
        debugPrint('success');
      }
      return response.statusCode;
    } on SocketException catch (e) {
      return 501;
    }
  }
}
