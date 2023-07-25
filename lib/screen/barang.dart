import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Barang extends StatefulWidget {
  const Barang({super.key});

  @override
  State<Barang> createState() => _BarangState();
}

class _BarangState extends State<Barang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Barang yang dapat dijual",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: ScreenUtil().setSp(15),
          ),
        ),
      ),
    );
  }
}
