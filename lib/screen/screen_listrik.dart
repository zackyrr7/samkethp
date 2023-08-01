import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/widget/Beranda/point.dart';

class ScreenListrik extends StatefulWidget {
  const ScreenListrik({super.key});

  @override
  State<ScreenListrik> createState() => _ScreenListrikState();
}

class _ScreenListrikState extends State<ScreenListrik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Voucher Listrik",
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.electric_bolt,
                          color: Colors.black,
                        ),
                        hintText: 'Total voucher yang anda inginkan',
                        labelText: 'Total',
                        labelStyle: TextStyle(color: Colors.black),
                        focusColor: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        hintText: 'Nomor PLN anda',
                        labelText: 'Nomor PLN',
                        labelStyle: TextStyle(color: Colors.black),
                        focusColor: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: ScreenUtil().setHeight(40),
                  width: ScreenUtil().setWidth(200),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Kirim",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(15)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
