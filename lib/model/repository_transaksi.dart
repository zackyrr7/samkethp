import 'dart:convert';

import 'package:samekt/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class RepositoryTransaksi {
  Future postTransaksi(String jenis_transaksis_id, String total, String nomor,
      String jenis, String users_id) async {
        final SharedPreferences sharedPreferences;
        sharedPreferences = await SharedPreferences.getInstance();
        try{
          final response  = await http.post(Uri.parse('$url/transaksi'), body:{
            'jenis_transaksis_id': jenis_transaksis_id,
            'total': total,
            'nomor': nomor,
            'jenis': jenis,
            'users_id': users_id
          } );

          if(response.statusCode == 200){
            var jsonResponse = json.decode(response.body);
            print('Response Status: ${response.body}');
            if (jsonResponse['status'].toString() == '200') {
               sharedPreferences.setString("message", jsonResponse['message'].toString());
               sharedPreferences.setString("message2", jsonResponse['message2'].toString());
               print(total);
               print(nomor);
               print(jenis);
               print(users_id);
              return true;
            }else if(jsonResponse['status'].toString() == '201') {
              sharedPreferences.setString("message", jsonResponse['message'].toString());
              sharedPreferences.setString("message2", jsonResponse['message2'].toString());
              return true;
            } else {
              sharedPreferences.setString("message", jsonResponse['message'].toString());
               print(total);
               print(nomor);
               print(jenis);
               print(users_id);
               print(jenis_transaksis_id);
              return false;
              
            } 
              
            
          } else {
             print(total);
               print(nomor);
               print(jenis);
               print(users_id);
            return false;
          } 
        }catch(e) {
          print(e.toString());
        }
      }
}
