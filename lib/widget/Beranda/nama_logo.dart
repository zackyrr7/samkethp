import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NamaLogo extends StatelessWidget {
  const NamaLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(60),
                ),
                color: Colors.white),
            height: ScreenUtil().setHeight(70),
            width: ScreenUtil().setHeight(70),
            child: Image.asset(
              "assets/images/logo2.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Text(
                "Selamat Datang,",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: ScreenUtil().setSp(12)),
              ),
              Text(
                "Jangan lupa menjaga kebersihan ya",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: ScreenUtil().setSp(12)),
              )
            ],
          )
        ],
      ),
    );
  }
}
