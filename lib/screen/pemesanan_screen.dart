// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:samekt/model/repository_pesan.dart';
import 'package:samekt/widget/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PemesananScreen extends StatefulWidget {
  const PemesananScreen({super.key});

  @override
  State<PemesananScreen> createState() => _PemesananScreenState();
}

class _PemesananScreenState extends State<PemesananScreen> {
  var alamat = TextEditingController();
  var barang = TextEditingController();
  DateTime tanggal = DateTime.now();
  String masukkan = "Masukkan Tanggal Penjemputan";
  RepositoryPesan repository = RepositoryPesan();
  String id = '';

  _loadid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('id') ?? '');
      print(id);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Pemesanan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                child: TextFormField(
                  controller: alamat,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      hintText: 'Alamat rumah anda',
                      labelText: 'Alamat',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                child: TextFormField(
                  controller: barang,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.restore_from_trash,
                        color: Colors.black,
                      ),
                      hintText: 'Jenis barang yang ingin dijual',
                      labelText: 'Barang',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
            child: Container(
                height: ScreenUtil().setHeight(70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.date_range),
                          Container(
                            width: ScreenUtil().setWidth(10),
                          ),
                          Text(masukkan)
                          // tanggal == DateTime.now()
                          //   ? "${tanggal.day} - ${tanggal.month} - ${tanggal.year}"
                          //   : "Masukkan Tanggal Penjemputan")
                          // "${tanggal.day} - ${tanggal.month} - ${tanggal.year}"),
                        ],
                      ),
                      GestureDetector(
                          onTap: () async {
                            final DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: tanggal,
                                firstDate: DateTime(200),
                                lastDate: DateTime(3000));
                            if (dateTime != null) {
                              setState(() {
                                tanggal = dateTime;
                                masukkan =
                                    "${tanggal.day} - ${tanggal.month} - ${tanggal.year}";
                              });
                            }
                          },
                          child: Icon(Icons.edit))
                    ],
                  ),
                )),
          ),
          GestureDetector(
            onTap: () async {
              bool response = await repository.postPesan(
                  masukkan.toString(), alamat.text, barang.text, id);
              if (response) {
                _showAlertDialogBerhasil(context);
              } else {
                _showAlertDialogGagal(context);
              }
            },
            child: Container(
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setWidth(200),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: Center(
                  child: Text(
                'Kirim',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(15)),
              )),
            ),
          )
        ],
      ),
    );
  }
}

_showAlertDialogBerhasil(BuildContext context) async {
  String message = 'Berhasil';
  String message2 =
      'Admin akan menghubungi anda untuk mengkonfirmasi pesanan dan untuk mengirim foto sampah yang akan dijual';
  SharedPreferences prefs = await SharedPreferences.getInstance();

  Widget okButton = TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const Navbar();
          },
        ));
      },
      child: const Text('Ok'));

  AlertDialog alert = AlertDialog(
    content: SizedBox(
      height: ScreenUtil().setHeight(100),
      child: Center(
        child: Column(children: [
          Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            message2,
            textAlign: TextAlign.center,
          )
        ]),
      ),
    ),
    actions: [okButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

_showAlertDialogGagal(BuildContext context) async {
  String message = '';
  // // String message2 = '';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  message = (prefs.getString('message') ?? '');
  // // message2 = (prefs.getString('message2') ?? '');
  Widget okButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Ok'));

  AlertDialog alert = AlertDialog(
    content: Text(message),
    actions: [okButton],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
