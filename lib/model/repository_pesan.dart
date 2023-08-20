// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:samekt/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RepositoryPesan {
  Future postPesan(
      String tanggal, String alamat, String jenis, String users_id) async {
    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    try {
      final response = await http.post(Uri.parse('$url/pesan'), body: {
        'tanggal': tanggal,
        'alamat': alamat,
        'jenis': jenis,
        'users_id': users_id
      });

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('Response Status: ${response.body}');
        if (jsonResponse['status'].toString() == '200') {
          sharedPreferences.setString(
              "message", jsonResponse['message'].toString());
          sharedPreferences.setString(
              "message2", jsonResponse['message2'].toString());

          print(jenis);
          print(users_id);
          return true;
        } else if (jsonResponse['status'].toString() == '201') {
          sharedPreferences.setString(
              "message", jsonResponse['message'].toString());
          sharedPreferences.setString(
              "message2", jsonResponse['message2'].toString());
          return true;
        } else {
          sharedPreferences.setString(
              "message", jsonResponse['message'].toString());

          print(jenis);
          print(users_id);

          return false;
        }
      } else {
        print(jenis);
        print(users_id);
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
