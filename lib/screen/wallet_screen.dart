import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/widget/Beranda/point.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  static const List<String> list = <String>[
    'Dana',
    'Shopeepay',
    'Gopay',
  ];
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "E-Wallet",
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
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Text(
                "Jenis E-Wallet",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              Container(
                width: ScreenUtil().setWidth(340),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    // icon: const Icon(Icons.go),
                    elevation: 16,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(15),
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                            Icons.card_giftcard,
                            color: Colors.black,
                          ),
                          hintText: 'Nomor E-Wallet Anda',
                          labelText: 'Nomor E-wallet',
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
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.money,
                            color: Colors.black,
                          ),
                          hintText: 'Total E-Wallet',
                          labelText: 'Total',
                          labelStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(50),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Kirim",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(18), color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
