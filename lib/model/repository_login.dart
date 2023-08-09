// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:samekt/constant.dart';

class RepositoryLogin {
  Future postLogin(String email, String password) async {
    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    try {
      final response = await http.post(Uri.parse('$url/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var jsonReponse = json.decode(response.body);

        print('Response Status: ${response.body}');
        if (jsonReponse['succes'].toString() == "true") {
          sharedPreferences.setString("id", jsonReponse['id'].toString());
          sharedPreferences.setString('no_hp',jsonReponse['no_hp']).toString();
          print(jsonReponse['succes']);
          print(jsonReponse['id']);

          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
