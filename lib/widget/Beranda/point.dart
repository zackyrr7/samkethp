import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/constant.dart';

class Point extends StatelessWidget {
  const Point({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 5.0,
            ),
          ], borderRadius: BorderRadius.circular(15), color: biruMain),
          width: ScreenUtil().setWidth(300),

          // height: ScreenUtil().setHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Saldo anda sebesar: ",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(
                      "assets/images/uang.png",
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Text(
                    "10.000",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                "Tanggal terakhir transaksi",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(15),
                ),
              ),
              Text(
                "tanggal",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
