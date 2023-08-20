// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/model/repository_transaksi.dart';
import 'package:samekt/widget/Beranda/point.dart';
import 'package:samekt/widget/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenEmas extends StatefulWidget {
  const ScreenEmas({super.key});

  @override
  State<ScreenEmas> createState() => _ScreenEmasState();
}

class _ScreenEmasState extends State<ScreenEmas> {
  RepositoryTransaksi repository = RepositoryTransaksi();

  String total = '0';
  String jenis_transaksis_id = "2";
  String jenis2 = "Emas 0,025 gram (Rp 60.000)";
  String id = '';
  String no_hp = '';
  static const List<String> list = <String>[
    'Emas 0,025 gram (Rp 60.000)',
    'Emas 0,05 gram (Rp 90.000)',
    'Emas 0,1 gram (Rp 150.000)',
    'Emas 0,2 gram (Rp 280.000)'
  ];
  _loadid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('id') ?? '');
      no_hp = (prefs.getString('no_hp') ?? '');
      print(id);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadid();
  }

  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Emas Mini",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Point(),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Text(
                "Berat emas yang diinginkan",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              Container(
                width: ScreenUtil().setWidth(340),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    // icon: const Icon(Icons.go),
                    elevation: 16,
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(15)),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                        jenis2 = dropdownValue;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              GestureDetector(
                onTap: () async {
                  bool response = await repository.postTransaksi(
                      jenis_transaksis_id, total, no_hp, jenis2, id);
                  if (response) {
                    _showAlertDialogBerhasil(context);
                  } else {
                    _showAlertDialogGagal(context);
                  }
                },
                child: Container(
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Kirim",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

_showAlertDialogBerhasil(BuildContext context) async {
  String message = '';
  String message2 = '';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  message = (prefs.getString('message') ?? '');
  message2 = (prefs.getString('message2') ?? '');
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
      height: ScreenUtil().setHeight(50),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(message), Text(message2)]),
    ),
    actions: [okButton],
  );

  // ignore: use_build_context_synchronously
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
