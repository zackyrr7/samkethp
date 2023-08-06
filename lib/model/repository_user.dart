import 'dart:convert';

import 'package:samekt/constant.dart';
import 'package:samekt/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceAkun {
  final baseurl = '$url/user';
  Future<UserDetail?> getAkun() async {
    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    final response = await http.get(Uri.parse('$baseurl/$id'));
    if (response.statusCode == 200) {
      return UserDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
