import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/model/pemasukan_model.dart';
import 'package:samekt/model/repository_pemasukan.dart';

class PemasukanScreen extends StatefulWidget {
  const PemasukanScreen({super.key});

  @override
  State<PemasukanScreen> createState() => _PemasukanScreenState();
}

class _PemasukanScreenState extends State<PemasukanScreen> {
  List<Data> listData = [];
  RepositoryPemasukan repository = RepositoryPemasukan();

  getData() async {
    listData = await repository.getPemasukan();
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
          itemCount: listData.length,
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
                      listData[index].tanggal,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(listData[index].status,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("+ ",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  color: Colors.green)),
                          Text(listData[index].saldo.toString(),
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
      ),
    );
  }
}
