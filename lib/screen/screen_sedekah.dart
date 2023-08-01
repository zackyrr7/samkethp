import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/widget/Beranda/point.dart';

class SedekahScreen extends StatefulWidget {
  const SedekahScreen({super.key});

  @override
  State<SedekahScreen> createState() => _SedekahScreenState();
}

class _SedekahScreenState extends State<SedekahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sedekah",
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
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
                          Icons.handshake,
                          color: Colors.black,
                        ),
                        hintText: 'Saldo yang anda ingin Sedekahkan',
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
                        hintText: 'Nomor HP anda',
                        labelText: 'Hp',
                        labelStyle: TextStyle(color: Colors.black),
                        focusColor: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(onTap: (){},
                child: Container(
                  height: ScreenUtil().setHeight(40),
                  width: ScreenUtil().setWidth(200),
                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Kirim",
                      style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(15)),
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
