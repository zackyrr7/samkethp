import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/screen/emas_screen.dart';
import 'package:samekt/screen/screen_listrik.dart';
import 'package:samekt/screen/screen_pdam.dart';
import 'package:samekt/screen/screen_sedekah.dart';
import 'package:samekt/screen/wallet_screen.dart';

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
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SedekahScreen();
                  }));
                },
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ScreenEmas();
                  }));
                },
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ScreenListrik();
                  }));
                },
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ScreenPdam();
                  }));
                },
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
                          image: AssetImage("assets/images/handphone (1).png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text(
                        "Pungisian Pulsa",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const WalletScreen();
                  }));
                },
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
