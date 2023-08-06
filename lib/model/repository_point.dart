import 'dart:convert';

import 'package:samekt/constant.dart';
import 'package:http/http.dart' as http;
import 'package:samekt/model/point_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  final baseurl = '$url/tabungan/total';
  Future<Saldo?> getSaldo() async {
    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    final response = await http.get(Uri.parse('$baseurl/$id'));
    if (response.statusCode == 200) {
      return Saldo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
