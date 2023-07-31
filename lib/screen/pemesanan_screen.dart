import 'package:flutter/material.dart';

class PemesananScreen extends StatefulWidget {
  const PemesananScreen({super.key});

  @override
  State<PemesananScreen> createState() => _PemesananScreenState();
}

class _PemesananScreenState extends State<PemesananScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Pemesanan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      hintText: 'Alamat rumah anda',
                      labelText: 'Alamat',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: 'Jenis barang yang ingin dijual',
                      labelText: 'Tanggal',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.restore_from_trash,
                        color: Colors.black,
                      ),
                      hintText: 'Jenis barang yang ingin dijual',
                      labelText: 'Barang',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
