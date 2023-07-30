import 'dart:convert';

import 'package:samekt/constant.dart';
import 'package:http/http.dart' as http;
import 'package:samekt/model/pertanyaan_model.dart';

class RepositoryPertanyaan {
  final _baseurl = '$url/pertanyaan';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Pertanyaan> pertanyaan =
            it.map((e) => Pertanyaan.fromJson(e)).toList();
        return pertanyaan;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
