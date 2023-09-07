import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/model/pengeluaran_model.dart';
import 'package:samekt/model/repository_pengeluaran.dart';

class PengeluaranScreen extends StatefulWidget {
  const PengeluaranScreen({super.key});

  @override
  State<PengeluaranScreen> createState() => _PengeluaranScreenState();
}

class _PengeluaranScreenState extends State<PengeluaranScreen> {
  List<DataP> listDataP = [];
  RepositoryPengeluaran repository = RepositoryPengeluaran();
  getData() async {
    listDataP = await repository.getPengeluaran();
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
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          reverse: true,
          shrinkWrap: true,
          itemCount: listDataP.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      listDataP[index].tanggal,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(listDataP[index].jenis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("- ",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  color: Colors.red)),
                          Text(listDataP[index].total.toString(),
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  color: Colors.red)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
