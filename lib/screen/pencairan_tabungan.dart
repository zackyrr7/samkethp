import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PencairanTabungan extends StatelessWidget {
  const PencairanTabungan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Pencairan Tabungan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(100),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(60),
                        child: const Image(
                          image: AssetImage("assets/images/love.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text(
                        "Sedekah",
                        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(100),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(60),
                        child: const Image(
                          image: AssetImage("assets/images/star.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text(
                        "Emas Mini",
                        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(100),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(60),
                        child: const Image(
                          image: AssetImage("assets/images/eco-house.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text(
                        "Voucher Listrik",
                        style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(100),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(60),
                        child: const Image(
                          image: AssetImage("assets/images/water-tap.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text(
                        "Pembayaran PDAM",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(100),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(60),
                        child: const Image(
                          image: AssetImage("assets/images/e-wallet.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text(
                        "E-Wallet",
                        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
