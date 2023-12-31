import 'package:flutter/material.dart';
import 'package:samekt/screen/pemasukan.dart';
import 'package:samekt/screen/pengeluaran.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('History'),
              centerTitle: true,
              pinned: true,
              floating: true,
              bottom: TabBar(
                indicator: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20)),
                tabs: const [
                  Tab(child: Text('Pemasukan')),
                  Tab(child: Text('Pengeluaran')),
                ],
              ),
            ),
          ];
        },
        body: const TabBarView(
          children: <Widget>[
            PemasukanScreen(),
            PengeluaranScreen(),
          ],
        ),
      )),
    );
  }
}
