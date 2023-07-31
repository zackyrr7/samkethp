import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/constant.dart';
import 'package:samekt/model/barang_model.dart';
import 'package:samekt/model/repository_barang.dart';

class ScreenBarang extends StatefulWidget {
  const ScreenBarang({super.key});

  @override
  State<ScreenBarang> createState() => _BarangState();
}

class _BarangState extends State<ScreenBarang> {
  List<Barang> listBarang = [];
  Repository repository = Repository();

  getData() async {
    listBarang = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Barang yang dapat dijual",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: ScreenUtil().setSp(15),
            ),
          ),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: listBarang.length,
            itemBuilder: (context, index) {
              var barang = listBarang[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: ((context) =>
                            _buildPopupDialog(context, barang)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 2, 2, 5),
                          child: SizedBox(
                            height: ScreenUtil().setHeight(100),
                            width: ScreenUtil().setWidth(150),
                            child: Image.network(
                              '$url2/storage/${listBarang[index].foto}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          listBarang[index].nama.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp. ${listBarang[index].harga.toString()}',
                          style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Widget _buildPopupDialog(BuildContext context, barang) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Text(
            barang.nama,
            style: TextStyle(fontSize: ScreenUtil().setSp(20)),
            textAlign: TextAlign.center,
          )),
          Image(image: NetworkImage('$url2/storage/${barang.foto}')),
          Center(
              child: Text(
            'Rp. ${barang.harga.toString()}',
            style: TextStyle(fontSize: ScreenUtil().setSp(20)),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}
