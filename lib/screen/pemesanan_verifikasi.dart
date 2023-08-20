import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/model/history_pesanan_model.dart';
import 'package:samekt/model/repository_history_pemesanan.dart';

class PemesananVerif extends StatefulWidget {
  const PemesananVerif({super.key});

  @override
  State<PemesananVerif> createState() => _PemesananVerifState();
}

class _PemesananVerifState extends State<PemesananVerif> {
  List<ListPesanan> listData = [];
  RepositoryPemesanan repository = RepositoryPemesanan();

  getData() async {
    listData = await repository.getAdmin();
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
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    listData[index].tanggal,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(listData[index].jenis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(listData[index].status,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(15),
                                color: Colors.green)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
