import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Bantuan extends StatelessWidget {
  const Bantuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Pertanyaan yang sering ditanyakan",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(15),
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Container(
              // height: ScreenUtil().setSp(25),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Bagaimana cara melakukan pemesanan layanan penjemputan sampah market?"),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _openWhatsAppChat();
        },
        label: Text(
          "Butuh Bantuan?",
          style: TextStyle(fontSize: ScreenUtil().setSp(12)),
        ),
      ),
    );
  }
}

void _openWhatsAppChat() async {
  String phoneNumber = '+6281347771171';
  String kalimat = 'Halo Admin';
  String url = 'https://wa.me/$phoneNumber?text=$kalimat';

  // ignore: deprecated_member_use
  await launch(url);
}
