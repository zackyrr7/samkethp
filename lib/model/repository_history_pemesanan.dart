import 'dart:convert';

import 'package:samekt/constant.dart';
import 'package:http/http.dart' as http;
import 'package:samekt/model/history_pesanan_model.dart';
import 'package:samekt/model/pemasukan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryPemesanan {
  final nunggu = '$url/pesan/nunggu';
  final admin = '$url/pesan/admin';
  final selesai = '$url/pesan/selesai';

  Future getNunggu() async {
    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    final response = await http.get(Uri.parse('$nunggu/$id'));
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      Iterable it = jsonDecode(response.body);
      List<ListPesanan> listPesanan =
          it.map((e) => ListPesanan.fromJson(e)).toList();
      return listPesanan;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future getAdmin() async {
    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    final response = await http.get(Uri.parse('$admin/$id'));
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      Iterable it = jsonDecode(response.body);
      List<ListPesanan> listPesanan =
          it.map((e) => ListPesanan.fromJson(e)).toList();
      return listPesanan;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future getSelesai() async {
    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    final response = await http.get(Uri.parse('$selesai/$id'));
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      Iterable it = jsonDecode(response.body);
      List<ListPesanan> listPesanan =
          it.map((e) => ListPesanan.fromJson(e)).toList();
      return listPesanan;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
