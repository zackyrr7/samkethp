import 'dart:convert';

import 'package:samekt/constant.dart';
import 'package:http/http.dart' as http;
import 'package:samekt/model/pemasukan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryPemasukan {
  final baseurl = '$url/tabungan/user';

  Future getPemasukan() async {
    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    final response = await http.get(Uri.parse('$baseurl/$id'));
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      Iterable it = jsonDecode(response.body)['data'];
      List<Data> data = it.map((e) => Data.fromJson(e)).toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
