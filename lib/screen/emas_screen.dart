import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/widget/Beranda/point.dart';

class ScreenEmas extends StatefulWidget {
  const ScreenEmas({super.key});

  @override
  State<ScreenEmas> createState() => _ScreenEmasState();
}

class _ScreenEmasState extends State<ScreenEmas> {
  static const List<String> list = <String>[
    '0,025 gram (Rp 60.000)',
    '0,05 gram (Rp 90.000)',
    '0,1 gram (Rp 150.000)',
    '0,2 gram (Rp 280.000)'
  ];
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
              Container(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(50),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Kirim",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(18), color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
