import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/model/repository_transaksi.dart';
import 'package:samekt/widget/Beranda/point.dart';
import 'package:samekt/widget/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenListrik extends StatefulWidget {
  const ScreenListrik({super.key});

  @override
  State<ScreenListrik> createState() => _ScreenListrikState();
}

class _ScreenListrikState extends State<ScreenListrik> {
   RepositoryTransaksi repository = RepositoryTransaksi();
  final _totalController = TextEditingController();
  final _nomorController = TextEditingController();
  String jenis_transaksis_id = "1";
  String jenis2 = "Voucher PLN";
  String id = '';

  _loadid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('id') ?? '');
      print (id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadid();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Voucher Listrik",
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                  child: TextFormField(controller: _totalController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.electric_bolt,
                          color: Colors.black,
                        ),
                        hintText: 'Total voucher yang anda inginkan',
                        labelText: 'Total',
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
                  child: TextFormField(controller: _nomorController,
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        hintText: 'Nomor PLN anda',
                        labelText: 'Nomor PLN',
                        labelStyle: TextStyle(color: Colors.black),
                        focusColor: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                 onTap: () async {
                  bool response = await repository.postTransaksi(
                      jenis_transaksis_id,
                      _totalController.text,
                      _nomorController.text,
                      jenis2,
                      id);
                      if (response) {
                        _showAlertDialogBerhasil(context);
                      } else {
                        _showAlertDialogGagal(context);
                      }
                },
                child: Container(
                  height: ScreenUtil().setHeight(40),
                  width: ScreenUtil().setWidth(200),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Kirim",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(15)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_showAlertDialogBerhasil(BuildContext context) async{
  String message = '';
  String message2 = '';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  message = (prefs.getString('message') ?? '');
  message2 = (prefs.getString('message2') ?? '');
  Widget okButton = TextButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder:(context) {
      return Navbar();
    },));
  }, child: Text('Ok'));

  AlertDialog alert = AlertDialog(
    content: SizedBox(height: ScreenUtil().setHeight(50),
      child: Center(
        child: Column(children: [
          Text(message),
          Text(message2)
        ]),
      ),
    ),
    actions: [
      okButton
    ],
  );

  // ignore: use_build_context_synchronously
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


_showAlertDialogGagal(BuildContext context) async{
  String message = '';
  // // String message2 = '';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  message = (prefs.getString('message') ?? '');
  // // message2 = (prefs.getString('message2') ?? '');
  Widget okButton = TextButton(onPressed: (){
    Navigator.pop(context);
  }, child: Text('Ok'));

  AlertDialog alert = AlertDialog(
    content: Text(message),actions: [
      okButton
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}