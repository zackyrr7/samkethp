import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/constant.dart';
import 'package:samekt/model/point_model.dart';
import 'package:samekt/model/repository_point.dart';

class Point extends StatefulWidget {
  const Point({
    super.key,
  });

  @override
  State<Point> createState() => _PointState();
}

class _PointState extends State<Point> {
  Service serviceApi = Service();
  late Future<Saldo?> listSaldo;
  @override
  void initState() {
    super.initState();
    listSaldo = serviceApi.getSaldo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Saldo?>(
      future: listSaldo,
      builder: (context, snapshot) {
        Saldo? listSaldo = snapshot.data;
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
                          listSaldo?.total.toString() ?? '0',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.white,
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
