import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samekt/constant.dart';
import 'package:samekt/model/pengeluaran_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryPengeluaran {
  final baseurl = '$url/transaksi/user';

  Future getPengeluaran() async {
    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    final response = await http.get(Uri.parse('$baseurl/$id'));
    if (response.statusCode == 200) {
      print(response.body);
      Iterable it = jsonDecode(response.body);
      List<DataP> data = it.map((e) => DataP.fromJson(e)).toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
