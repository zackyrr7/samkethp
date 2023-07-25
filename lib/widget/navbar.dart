import 'package:flutter/material.dart';

import 'package:samekt/constant.dart';
import 'package:samekt/screen/akun.dart';
import 'package:samekt/screen/bantuan.dart';
import 'package:samekt/screen/beranda.dart';
import 'package:samekt/screen/histori.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const Beranda(),
    const History(),
    const Bantuan(),
    const Akun()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: biruMain,
        unselectedItemColor: Colors.grey,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Transaksi'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Bantuan'),
          BottomNavigationBarItem(icon: Icon(Icons.portrait), label: 'Akun')
        ],
      ),
    );
  }
}
