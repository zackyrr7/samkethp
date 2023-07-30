class Pertanyaan {
  int id;
  String judul;
  String jawaban;

  Pertanyaan({required this.id, required this.judul, required this.jawaban});

  factory Pertanyaan.fromJson(Map<String, dynamic> json) {
    return Pertanyaan(
      id: json['id'],
      judul: json['judul'],
      jawaban: json['jawaban'],
    );
  }
}
