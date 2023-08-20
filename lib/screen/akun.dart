// ignore_for_file: avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/model/repository_user.dart';
import 'package:samekt/model/user_model.dart';
import 'package:samekt/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Akun extends StatefulWidget {
  const Akun({super.key});

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  ServiceAkun serviceApi = ServiceAkun();
  late Future<UserDetail?> listAkun;
  late final SharedPreferences sharedPreferences;
  String id = '';

  _loadid() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      id = (sharedPreferences.getString('id') ?? '');
      print(id);
    });
  }

  @override
  void initState() {
    super.initState();
    listAkun = serviceApi.getAkun();
    _loadid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              sharedPreferences.clear();
              //sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()),
                  (Route<dynamic> route) => false);
            },
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "Keluar",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            )),
          )
        ],
        title: const Text("Akun"),
      ),
      body: FutureBuilder<UserDetail?>(
        future: listAkun,
        builder: (context, snapshot) {
          UserDetail? listAkun = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Informasi Akun",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     showDialog(
                      //         context: context,
                      //         builder: ((context) =>
                      //             _buildPopupDialog(context)));
                      //   },
                      //   child: Text(
                      //     "Edit",
                      //     style: TextStyle(
                      //         color: Colors.lightBlue,
                      //         fontSize: ScreenUtil().setSp(15)),
                      //   ),
                      // )
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Container(
                  // height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(360),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    color: Colors.white,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 0, 3),
                          child: Text(
                            "Nama",
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: ScreenUtil().setWidth(350),
                            // height: ScreenUtil().setHeight(60),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    listAkun?.name ?? '',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(15)),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(2),
                ),
                Container(
                  // height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(360),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    color: Colors.white,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 0, 3),
                          child: Text(
                            "Email",
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: ScreenUtil().setWidth(350),
                            // height: ScreenUtil().setHeight(60),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    listAkun?.email ?? '',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(15)),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(2),
                ),
                Container(
                  // height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(360),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    color: Colors.white,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 0, 3),
                          child: Text(
                            "Nomor Hp",
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: ScreenUtil().setWidth(350),
                            // height: ScreenUtil().setHeight(60),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    listAkun?.no_hp ?? '',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(15)),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(2),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Akun Kami",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                      child: GestureDetector(
                        onTap: _openWa,
                        child: Container(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white),
                          child: Image(
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setWidth(40),
                            image:
                                const AssetImage("assets/images/whatsapp.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                      child: GestureDetector(
                        onTap: _opentt,
                        child: Container(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white),
                          child: Image(
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setWidth(40),
                            image:
                                const AssetImage("assets/images/tik-tok.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                      child: GestureDetector(
                        onTap: _openIg,
                        child: Container(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white),
                          child: Image(
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setWidth(40),
                            image:
                                const AssetImage("assets/images/instagram.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                      child: GestureDetector(
                        onTap: _openWeb,
                        child: Container(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white),
                          child: Image(
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setWidth(40),
                            image: const AssetImage(
                                "assets/images/world-wide-web.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

void _openWa() async {
  String phoneNumber = '+6281347771171';

  String url = 'https://wa.me/$phoneNumber?text=';

  // ignore: deprecated_member_use
  await launch(url);
}

void _opentt() async {
  String url = 'http://www.tiktok.com/@sampahmarket';

  // ignore: deprecated_member_use
  await launch(url);
}

void _openIg() async {
  String url = 'https://www.instagram.com/sampah_market/';

  // ignore: deprecated_member_use
  await launch(url);
}

void _openWeb() async {
  String url = 'https://sampahmarket.com/';

  // ignore: deprecated_member_use
  await launch(url);
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text("Edit Akun"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Nama Anda',
              labelText: 'Nama',
              labelStyle: TextStyle(color: Colors.black),
              focusColor: Colors.black),
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              icon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Email anda',
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.black),
              focusColor: Colors.black),
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
              icon: Icon(
                Icons.phone,
                color: Colors.black,
              ),
              hintText: 'Nomor Handphone',
              labelText: 'HP',
              labelStyle: TextStyle(color: Colors.black),
              focusColor: Colors.black),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        ElevatedButton(onPressed: () {}, child: const Text("Simpan"))
      ],
    ),
  );
}
