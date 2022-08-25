import 'dart:convert';
import 'dart:io';

import 'package:api_task/controler/api2_controler.dart';
import 'package:api_task/model/api2_model.dart';
import 'package:http/http.dart' as http;

class Api2Rrepo {
  static Future<int> getApi2data() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/unknown'));
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Api2Controler.controler = Api2Model.fromJson(data);
      } else {}
      return response.statusCode;
    } on SocketException catch (e) {
      return 501;
    }
  }
}
