import 'package:flutter/material.dart';

import '../../model/pertanyaan_model.dart';

class Detail extends StatefulWidget {
  final Pertanyaan pertanyaaan;
  // ignore: use_key_in_widget_constructors
  const Detail({required this.pertanyaaan});

  // ignore: use_key_in_widget_constructors
  // const Detail( this.pertanyaaan);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    widget.pertanyaaan.judul,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
                  child: Text(
                    widget.pertanyaaan.jawaban,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
