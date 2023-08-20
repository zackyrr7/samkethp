class Barang {
  final String nama;
  final String foto;
  final String harga;

  Barang({
    required this.nama,
    required this.foto,
    required this.harga,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(nama: json['nama'], foto: json['foto'], harga: json['harga']);
  }
}
