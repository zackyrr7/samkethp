import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/model/pertanyaan_model.dart';
import 'package:samekt/model/repository_pertanyaan.dart';

import 'package:url_launcher/url_launcher.dart';

class Bantuan extends StatefulWidget {
  const Bantuan({super.key});

  @override
  State<Bantuan> createState() => _BantuanState();
}

class _BantuanState extends State<Bantuan> {
  List<Pertanyaan> listPertanyaan = [];
  RepositoryPertanyaan repository = RepositoryPertanyaan();

  getData() async {
    listPertanyaan = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
      body: ListView.builder(
          itemCount: listPertanyaan.length,
          itemBuilder: (context, index) {
            var pertanyaan = listPertanyaan[index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) =>
                          _buildPopupDialog(context, pertanyaan)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(listPertanyaan[index].judul)),
                ),
              ),
            );
          }),
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

Widget _buildPopupDialog(BuildContext context, pertanyaan) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
            child: Text(
          pertanyaan.judul,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Center(
            child: Text(
          pertanyaan.jawaban,
          style: TextStyle(fontSize: ScreenUtil().setSp(15)),
          textAlign: TextAlign.justify,
        ))
      ],
    ),
  );
}
