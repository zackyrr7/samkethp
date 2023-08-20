// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samekt/constant.dart';

class RepositoryRegister {
  Future postRegister(
    String email,
    String password,
    String name,
    // ignore: non_constant_identifier_names
    String confirm_password,
    // ignore: non_constant_identifier_names
    String no_hp,
  ) async {
    try {
      final response = await http.post(Uri.parse('$url/register'), body: {
        'name': name,
        'confirm_password': confirm_password,
        'no_hp': no_hp,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        var jsonReponse = json.decode(response.body);

        print('Response Status: ${response.body}');
        if (jsonReponse['succes'].toString() == "true") {
          print(jsonReponse['succes']);
          return true;
        } else {
          print(password);
          print(confirm_password);

          print(no_hp);
          print(jsonReponse);
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
