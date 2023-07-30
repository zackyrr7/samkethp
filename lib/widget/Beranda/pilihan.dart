import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/constant.dart';

import 'package:samekt/screen/barang.dart';

class Piliihan extends StatelessWidget {
  const Piliihan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: ScreenUtil().setHeight(50),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                const Icon(
                  Icons.message,
                  color: biruMain,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Text(
                  "Pemesanan",
                  style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: ScreenUtil().setHeight(50),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                const Icon(
                  Icons.attach_money,
                  color: biruMain,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Text(
                  "Pencairan Tabungan",
                  style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ScreenBarang();
            }));
          },
          child: Container(
            height: ScreenUtil().setHeight(50),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                const Icon(
                  Icons.add_shopping_cart,
                  color: biruMain,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Text(
                  "Barang yang dapat dijual",
                  style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
