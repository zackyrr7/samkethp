import 'package:flutter/material.dart';
import 'package:samekt/screen/pemesanan_nunggu.dart';
import 'package:samekt/screen/pemesanan_screen.dart';
import 'package:samekt/screen/pemesanan_selesai.dart';
import 'package:samekt/screen/pemesanan_verifikasi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListPemesananScreen extends StatefulWidget {
  const ListPemesananScreen({super.key});

  @override
  State<ListPemesananScreen> createState() => _ListPemesananScreenState();
}

class _ListPemesananScreenState extends State<ListPemesananScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('History Pemesanan'),
                centerTitle: true,
                pinned: true,
                floating: true,
                bottom: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20)),
                  tabs:  [
                    Tab(
                        child: Text(
                      'Menunggu verifikasi',
                      textAlign: TextAlign.center,style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                    )),
                    Tab(
                        child: Text(
                      'Menunggu Penjemputan',
                      textAlign: TextAlign.center,style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                    )),
                    Tab(
                        child: Text(
                      'Pesanan Selesai',
                      textAlign: TextAlign.center,style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                    )),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: <Widget>[
              PemesananVerif(),
              PemesananNungguScreen(),
              PemesananSelesaiScreen(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PemesananScreen();
            }));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
