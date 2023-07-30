import 'dart:convert';

import 'package:samekt/constant.dart';
import 'package:http/http.dart' as http;
import 'barang_model.dart';

class Repository {
  final _baseurl = '$url/barang';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Barang> barang = it.map((e) => Barang.fromJson(e)).toList();
        return barang;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
