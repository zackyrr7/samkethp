import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:samekt/widget/Beranda/nama_logo.dart';
import 'package:samekt/widget/Beranda/pilihan.dart';
import 'package:samekt/widget/Beranda/point.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NamaLogo(),
              const Point(),
              SizedBox(
                height: ScreenUtil().setHeight(8),
              ),
              const Piliihan(),
            ],
          ),
        ),
      ),
    );
  }
}
